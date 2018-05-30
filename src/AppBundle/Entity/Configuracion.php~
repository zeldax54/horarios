<?php
// src/AppBundle/Entity/Configuracion.php

namespace AppBundle\Entity;


use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="configuracion")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\ConfiguracionRepository")
 */
class Configuracion
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="urlxmlphp", type="string",length=1000)
     */
    private $urlxmlphp;

    /**
     * @var string
     *
     * @ORM\Column(name="urlxmlclima", type="string",length=1000)
     */
    private $urlxmlclima;

    /**
     * @var string
     *
     * @ORM\Column(name="urlxmlcintillo", type="string",length=1000)
     */
    private $urlxmlcintillo;

    /**
     * @var integer
     *
     * @ORM\Column(name="sliderelemntTime", type="integer")
     */
    private $sliderelemntTime;




    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set urlxmlphp
     *
     * @param string $urlxmlphp
     *
     * @return Configuracion
     */
    public function setUrlxmlphp($urlxmlphp)
    {
        $this->urlxmlphp = $urlxmlphp;

        return $this;
    }

    /**
     * Get urlxmlphp
     *
     * @return string
     */
    public function getUrlxmlphp()
    {
        return $this->urlxmlphp;
    }

    /**
     * Set urlxmlclima
     *
     * @param string $urlxmlclima
     *
     * @return Configuracion
     */
    public function setUrlxmlclima($urlxmlclima)
    {
        $this->urlxmlclima = $urlxmlclima;

        return $this;
    }

    /**
     * Get urlxmlclima
     *
     * @return string
     */
    public function getUrlxmlclima()
    {
        return $this->urlxmlclima;
    }

    /**
     * Set urlxmlcintillo
     *
     * @param string $urlxmlcintillo
     *
     * @return Configuracion
     */
    public function setUrlxmlcintillo($urlxmlcintillo)
    {
        $this->urlxmlcintillo = $urlxmlcintillo;

        return $this;
    }

    /**
     * Get urlxmlcintillo
     *
     * @return string
     */
    public function getUrlxmlcintillo()
    {
        return $this->urlxmlcintillo;
    }

    /**
     * Set sliderelemntTime
     *
     * @param \int $sliderelemntTime
     *
     * @return Configuracion
     */
    public function setSliderelemntTime($sliderelemntTime)
    {
        $this->sliderelemntTime = $sliderelemntTime;

        return $this;
    }

    /**
     * Get sliderelemntTime
     *
     * @return \int
     */
    public function getSliderelemntTime()
    {
        return $this->sliderelemntTime;
    }
}
