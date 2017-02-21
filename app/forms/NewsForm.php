<?php
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\Date;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class NewsForm extends \Phalcon\Forms\Form
{

    public function initialize($entity = null, $options = null)
    {

        $title = new Text("title",
            [
                "size" => 50,
                "id" => "name",
                "onkeyup" => "translit()",
                "maxlength" => 50
            ]);

        $title->addValidator(
            new StringLength([
                'max' => 50,
                'min' => 10,
                'messageMaximum' => 'Заголовок не может содержать больше 50 символов',
                'messageMinimum' => 'Заголовок не может содержать меньше 10 символов'
            ]));

                $title->addValidator(
                    new RegexValidator([
                        'pattern' => '/^[а-яёА-ЯЁ\s-]+$/u',
                        'message' => 'Заголовок может содержать только русские буквы, пробелы и тире'
                    ]));

        $this->add($title);

        $key = new Text("key", [
            "size" => 40
        ]);

        $key->addValidator(
            new StringLength([
                'min' => 5,
                'max' => 50,
                'messageMaximum' => 'Поле keywords не может содержать больше 50 символов',
                'messageMinimum' => 'Поле keywords не может содержать меньше 5 символов'
            ]));

        $this->add($key);

        $desc = new TextArea("desc", [
            "cols" => 50, "rows" => 3
        ]);

        $desc->addValidator(
            new StringLength([
                'min' => 10,
                'messageMinimum' => 'Текст короткого содержания не может быть меньше 10 символов'
            ]));

        $this->add($desc);

        $photo = new \Phalcon\Forms\Element\File("photo", [
            "accept" => "image/*",
        ]);

       $photo->addValidator(
            new PresenceOf(
                [
                    "message" => "Поле Photo обязательно для заполнения",
                ]
            )
        );

        $this->add($photo);

        $text = new TextArea("text", [
            "cols" => 100, "rows" => 10
        ]);

        $text->addValidator(
            new StringLength([
                'min' => 5,
                'messageMinimum' => 'Поле с текстом новости не должно содержать менее 5 символов'
            ]));

        $this->add($text);

        $date = new Text("date", [
            "id" => "datepicker"
        ]);

        $date->addValidator(
            new Date([
                "message" => "Неверная дата",
            ]));

        $this->add($date);

        $url = new \Phalcon\Forms\Element\Hidden("url", [
            "size" => 50,
            "id" => "alias"
        ]);

        $this->add($url);

        $cat_id = new Select("cat_id", Category::find(), [
            "using" => [
                "id",
                "name",
            ]]);
        $this->add($cat_id);

    }

    public function beforeValidation($data, $entity)
    {
            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();
                if($files[0]->getName()!=''){
                    foreach ($files as $file) {

                        $photoPath = '/img/' . $file->getName();

                        if ($file->moveTo(BASE_PATH . "/public" . $photoPath)) {
                            $data['photo'] = $photoPath;
                        } else {
                            return false;
                        }
                    }
                }
            }
        $this->bind($data, $entity);

        return true;
    }

    public function afterValidation($messages)
    {
        if (count($messages) > 0) {

            $files = $this->request->getUploadedFiles();

            foreach ($files as $file) {

                $photoPath = BASE_PATH . '/public/img/' . $file->getName();
                unlink($photoPath);
            }
        }
    }


}