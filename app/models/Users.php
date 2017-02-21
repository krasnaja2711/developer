<?php

use Phalcon\Validation;
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
        $this->setSchema("developer");
        $this->hasMany('id', 'Like', 'user_id', ['alias' => 'Like']);
        $this->hasMany('id', 'News', 'user_id', ['alias' => 'News']);

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
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getLogin()
    {
        return $this->login;
    }

    /**
     * @param string $login
     */
    public function setLogin($login)
    {
        $this->login = $login;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getPass()
    {
        return $this->pass;
    }

    /**
     * @param string $pass
     */
    public function setPass($pass)
    {
        $this->pass = $pass;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * @param string $phone
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;
    }

    /**
     * @return string
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param string $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * @return int
     */
    public function getIdRoles()
    {
        return $this->id_roles;
    }

    /**
     * @param int $id_roles
     */
    public function setIdRoles($id_roles)
    {
        $this->id_roles = $id_roles;
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
