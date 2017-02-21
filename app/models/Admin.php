<?php

class Admin extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=30, nullable=false)
     */
    public $login;

    /**
     *
     * @var string
     * @Column(type="string", length=30, nullable=false)
     */
    public $pass;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cats");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'admin';
    }

}
