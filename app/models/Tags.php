<?php

class Tags extends \Phalcon\Mvc\Model
{
    /**
     * @return int
     */
    public function getNewsId()
    {
        return $this->news_id;
    }

    /**
     * @return int
     */
    public function getTagId()
    {
        return $this->tag_id;
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
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $news_id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $tag_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("developer");
        $this->belongsTo('news_id', '\News', 'id', ['alias' => 'News']);
        $this->belongsTo('tag_id', '\TagsName', 'id', ['alias' => 'TagsName']);
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'tags';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tags[]|Tags
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tags
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
