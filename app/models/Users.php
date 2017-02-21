<?php

use Phalcon\Validation;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness;

class Users extends \Phalcon\Mvc\Model
{
    /**
     * Validations and business logic
     *
     * @return boolean
     */

    public function validation()
    {
        $validator = new Validation();

        $validator->add("login", new Uniqueness([
            "message" => "Такой логин уже существует",
        ]));

        $validator->add('email', new Uniqueness([
            "message" => "Такой email уже существует"
        ]));

        return $this->validate($validator);

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
     * @Column(type="string", length=50, nullable=false)
     */
    public $login;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $pass;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id_roles;



    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cats");
        $this->belongsTo('id_roles', '\Roles', 'id', ['alias' => 'Roles']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'users';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users[]|Users
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);


    }

}
