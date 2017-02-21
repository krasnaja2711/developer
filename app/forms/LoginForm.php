<?php
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\Regex as RegexValidator;
use Phalcon\Validation\Validator\StringLength;

class LoginForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {

        $login = new Text("login",
            [
                "size" => 20,
                "maxlength" => 30,
                 "id"=>"login",

            ]);

        $login ->addValidator(
            new RegexValidator([
                'pattern' => '/^[a-zA-Z-_]+$/u',
                'message' => 'Логин может содержать только английские буквы'
            ]));

        $this->add($login);

        $pass = new Password("pass",[
            "size"=>20,
            "maxlength"=>30,
            "id"=>"pass",
        ]);
        $pass->addValidator(
            new StringLength([
                'min' => 5,
                'messageMinimum' => 'Пароль не может содержать меньше 5 символов'
            ]));

        $pass->addFilter('trim');

        $this->add($pass);
    }

}