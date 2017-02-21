<?php
use Phalcon\Validation\Validator\PresenceOf;
class CommentsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {

        $parent_id = new \Phalcon\Forms\Element\Text("parent_id");
        $this->add($parent_id);
        $comment = new \Phalcon\Forms\Element\TextArea("comment",[
           " placeholder"=>"Введите комментарий",
            "cols"=>100,
            "rows"=>3,
            "class" => 'comm'
        ]);

        $comment->addValidator(
            new PresenceOf(
                [
                    "message" => "Введите коментарий",
                ]
            )
        );


        $this->add($comment);

        $date = new \Phalcon\Forms\Element\Text("date");
        $this->add($date);
        $news_id = new \Phalcon\Forms\Element\Text("news_id");
        $this->add($news_id);


    }

}