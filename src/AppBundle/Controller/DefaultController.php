<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    public function adminStartAction(Request $request){

        return $this->render('AppBundle::adminStart.html.twig', [

        ]);

    }

    public function pageNotFoundAction(Request $request){

        return $this->render('AppBundle::urlerror.html.twig', [

        ]);

    }

    public function horarioStartAction(Request $request){

        $em = $this->getDoctrine()->getManager();
        $managerMedia = $this->get('sonata.media.manager.media');
        $medias=$managerMedia->findAll();
        $area=$request->get('area');
        $configuracion = $em->getRepository('AppBundle:Configuracion')->find(1);
        $configuracion->setUrlxmlphp($configuracion->getUrlxmlphp().$area);
        foreach($medias as $m){
            $m->provider_name=$m->getP();
        }

        return $this->render('AppBundle::horario.html.twig', [
            'medias'=>$medias,
            'configuracion'=>$configuracion
        ]);

    }



}
