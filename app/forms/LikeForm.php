<?php
class LikeForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {

        $user_id = new \Phalcon\Forms\Element\Hidden("user_id");
        $this->add($user_id);
        $news_id = new \Phalcon\Forms\Element\Hidden("news_id");
        $this->add($news_id);

    }

}