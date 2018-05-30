<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Configuracion;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Configuracion controller.
 *
 */
class ConfiguracionController extends Controller
{
    /**
     * Lists all configuracion entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $configuracions = $em->getRepository('AppBundle:Configuracion')->findAll();

        return $this->render('configuracion/index.html.twig', array(
            'configuracions' => $configuracions,
        ));
    }

    /**
     * Creates a new configuracion entity.
     *
     */
    public function newAction(Request $request)
    {
        $configuracion = new Configuracion();
        $form = $this->createForm('AppBundle\Form\ConfiguracionType', $configuracion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($configuracion);
            $em->flush();

            return $this->redirectToRoute('admin_configuracion_show', array('id' => $configuracion->getId()));
        }

        return $this->render('configuracion/new.html.twig', array(
            'configuracion' => $configuracion,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a configuracion entity.
     *
     */
    public function showAction(Configuracion $configuracion)
    {
        $deleteForm = $this->createDeleteForm($configuracion);

        return $this->render('configuracion/show.html.twig', array(
            'configuracion' => $configuracion,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing configuracion entity.
     *
     */
    public function editAction(Request $request, Configuracion $configuracion)
    {
        $deleteForm = $this->createDeleteForm($configuracion);
        $editForm = $this->createForm('AppBundle\Form\ConfiguracionType', $configuracion);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            return $this->redirectToRoute('admin_configuracion_edit', array('id' => $configuracion->getId()));
        }

        return $this->render('AppBundle:configuracion:edit.html.twig', array(
            'configuracion' => $configuracion,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a configuracion entity.
     *
     */
    public function deleteAction(Request $request, Configuracion $configuracion)
    {
        $form = $this->createDeleteForm($configuracion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($configuracion);
            $em->flush();
        }

        return $this->redirectToRoute('admin_configuracion_index');
    }

    /**
     * Creates a form to delete a configuracion entity.
     *
     * @param Configuracion $configuracion The configuracion entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Configuracion $configuracion)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_configuracion_delete', array('id' => $configuracion->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
