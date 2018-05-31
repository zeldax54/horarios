<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ConfiguracionType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('urlxmlphp',null,array(
                'label'=>'URL XML HORARIOS',
                'attr'=>array(
                    'required'=>true,
                    'class'=>'form-control'
                )
            ))
            ->add('urlxmlclima',null,array(
                'label'=>'URL XML CLIMA',
                'attr'=>array(
                    'required'=>true,
                    'class'=>'form-control'
                )
            ))
            ->add('urlxmlcintillo',null,array(
                'label'=>'URL XML NOTICIAS',
                'attr'=>array(
                    'required'=>true,
                    'class'=>'form-control'
                )
            ))
            ->add('sliderelemntTime',null,array(
                'label'=>'Minutos que se muestran los elementos del slider',
                'attr'=>array(
                    'required'=>true,
                    'class'=>'form-control'
                )
            ))
            ->add('climaelemntTime',null,array(
                'label'=>'Minutos de refresco de la información del clima',
                'attr'=>array(
                    'required'=>true,
                    'class'=>'form-control'
                )
            ))


        ;
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Configuracion'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_configuracion';
    }


}
