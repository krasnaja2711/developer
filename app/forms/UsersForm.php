<?php

use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\Date;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex as RegexValidator;
use Phalcon\Validation\Validator\StringLength;

class UsersForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        $login = new Text("login");

        $login->addValidator(
            new PresenceOf(
                [
                    "message" => "Поле Login обязательно для заполнения",
                ]
            )
        );

        $login->addValidator(
            new StringLength([
                'max' => 50,
                'min' => 5,
                'messageMaximum' => 'Логин не может содержать больше 50 символов',
                'messageMinimum' => 'Логин не может содержать меньше 5 символов'
            ]));

        $login->addValidator(
            new RegexValidator([
                'pattern' => '/^[a-zA-Z0-9_-]+$/u',
                'message' => 'Логин может содержать только английские буквы'
            ]));

        $this->add($login);

        $name = new Text("name");

        $name->addValidator(
            new PresenceOf(
                [
                    "message" => "Поле Name обязательно для заполнения",
                ]
            )
        );

        $name->addValidator(
            new StringLength([
                'max' => 50,
                'min' => 5,
                'messageMaximum' => 'Имя не может содержать больше 50 символов',
                'messageMinimum' => 'Имя не может содержать меньше 5 символов'
            ]));

        $name->addValidator(
            new RegexValidator([
                'pattern' => '/^[а-яА-ЯёЁa-zA-Z]+$/u',
                'message' => 'Имя может содержать только буквы'
            ]));

        $this->add($name);

        $pass = new Password("pass");

        $pass->addValidator(
            new StringLength([
                'min' => 5,
                'messageMinimum' => 'Пароль не может содержать меньше 5 символов'
            ]));

        $pass->addFilter('trim');

        $this->add($pass);

        $email = new Text("email");

        $email->addValidator(
            new Email([
                "message" => "E-mail не является действительным",
            ]));

        $this->add($email);

        $phone = new Text("phone");

        $phone->addValidator(
            new RegexValidator([
                'pattern' => '/^\+\d{3}\(\d{2}\)\d{3}-\d{2}-\d{2}$/',
                'message' => 'Номер телефона в формате +(375)(__)___-__-__'
            ]));

        $this->add($phone);

        $date = new Text("date", [
            "id" => "datepicker"
        ]);

        $date->addValidator(
            new Date([
                "message" => "Неверная дата",
            ]));

        $this->add($date);

        $id_roles = new \Phalcon\Forms\Element\Hidden("id_roles", [
            "value" => 2,
        ]);

        $this->add($id_roles);

    }
}