<?php

class Category extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->hasMany("id", "News", "id");

    }
    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;
    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $name;
    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $url;

    /**
     * @param null $parameters
     *
     * @return \Phalcon\Mvc\ResultsetInterface|Category[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * @param null $parameters
     *
     * @return \Phalcon\Mvc\Model|Category
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }




}