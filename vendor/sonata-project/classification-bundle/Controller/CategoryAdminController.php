<?php

/*
 * This file is part of the Sonata Project package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Sonata\ClassificationBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController as Controller;
use Symfony\Bridge\Twig\AppVariable;
use Symfony\Bridge\Twig\Command\DebugCommand;
use Symfony\Bridge\Twig\Extension\FormExtension;
use Symfony\Bridge\Twig\Form\TwigRenderer;
use Symfony\Component\Form\FormRenderer;
use Symfony\Component\Form\FormView;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Category Admin Controller.
 *
 * @author Thomas Rabaix <thomas.rabaix@sonata-project.org>
 */
class CategoryAdminController extends Controller
{
    /**
     * @param Request $request
     *
     * @return Response
     */
    public function listAction(Request $request = null)
    {
        if (!$request->get('filter') && !$request->get('filters')) {
            return new RedirectResponse($this->admin->generateUrl('tree', $request->query->all()));
        }

        if ($listMode = $request->get('_list_mode')) {
            $this->admin->setListMode($listMode);
        }

        $datagrid = $this->admin->getDatagrid();
        $datagridValues = $datagrid->getValues();

        $datagridContextIsSet = isset($datagridValues['context']['value']) && !empty($datagridValues['context']['value']);

        //ignore `context` persistent parameter if datagrid `context` value is set
        if ($this->admin->getPersistentParameter('context') && !$datagridContextIsSet) {
            $datagrid->setValue('context', null, $this->admin->getPersistentParameter('context'));
        }

        $formView = $datagrid->getForm()->createView();

        // set the theme for the current Admin Form
        $this->setFormTheme($formView, $this->admin->getFilterTheme());

        return $this->render($this->admin->getTemplate('list'), array(
            'action' => 'list',
            'form' => $formView,
            'datagrid' => $datagrid,
            'csrf_token' => $this->getCsrfToken('sonata.batch'),
        ));
    }

    /**
     * @param Request $request
     *
     * @return Response
     */
    public function treeAction(Request $request)
    {
        $categoryManager = $this->get('sonata.classification.manager.category');
        $currentContext = false;
        if ($context = $request->get('context')) {
            $currentContext = $this->get('sonata.classification.manager.context')->find($context);
        }

        // all root categories.
        $rootCategoriesSplitByContexts = $categoryManager->getRootCategoriesSplitByContexts(false);

        // root categories inside the current context
        $currentCategories = array();

        if (!$currentContext && !empty($rootCategoriesSplitByContexts)) {
            $currentCategories = current($rootCategoriesSplitByContexts);
            $currentContext = current($currentCategories)->getContext();
        } else {
            foreach ($rootCategoriesSplitByContexts as $contextId => $contextCategories) {
                if ($currentContext->getId() != $contextId) {
                    continue;
                }

                foreach ($contextCategories as $category) {
                    if ($currentContext->getId() != $category->getContext()->getId()) {
                        continue;
                    }

                    $currentCategories[] = $category;
                }
            }
        }

        $datagrid = $this->admin->getDatagrid();

        if ($this->admin->getPersistentParameter('context')) {
            $datagrid->setValue('context', null, $this->admin->getPersistentParameter('context'));
        }

        $formView = $datagrid->getForm()->createView();

        $this->setFormTheme($formView, $this->admin->getFilterTheme());

        return $this->render($this->admin->getTemplate('tree'), array(
            'action' => 'tree',
            'current_categories' => $currentCategories,
            'root_categories' => $rootCategoriesSplitByContexts,
            'current_context' => $currentContext,
            'form' => $formView,
            'csrf_token' => $this->getCsrfToken('sonata.batch'),
        ));
    }

    /**
     * Sets the admin form theme to form view. Used for compatibility between Symfony versions.
     *
     * @param FormView $formView
     * @param string   $theme
     */
    private function setFormTheme(FormView $formView, $theme)
    {
        $twig = $this->get('twig');
        // BC for Symfony < 3.2 where this runtime does not exists
        if (!method_exists(AppVariable::class, 'getToken')) {
            $twig->getExtension(FormExtension::class)->renderer->setTheme($formView, $theme);
            return;
        }
        // BC for Symfony < 3.4 where runtime should be TwigRenderer
        if (!method_exists(DebugCommand::class, 'getLoaderPaths')) {
            $twig->getRuntime(TwigRenderer::class)->setTheme($formView, $theme);
            return;
        }
        $twig->getRuntime(FormRenderer::class)->setTheme($formView, $theme);
    }
}
