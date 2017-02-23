<?php
class TagsForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $options = null)
    {
        $news_id = new \Phalcon\Forms\Element\Hidden("news_id");
        $this->add($news_id);
        $tag_id = new \Phalcon\Forms\Element\Hidden("tag_id");
        $this->add($tag_id);

    }

}