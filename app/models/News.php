<?php
use Phalcon\Validation;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phalcon\Validation\Validator\Uniqueness;

class News extends \Phalcon\Mvc\Model
{
    public function validation()
    {
        $validator = new Validation();

         $validator->add("title", new Uniqueness([
           "message" => "Такой заголовок уже существует!",
        ]));

        $validator->add('url', new Uniqueness([
           "message" => "Напишите другой slug"
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
    public $title;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $key;

    /**
     *
     * @var string
     * @Column(type="string", length=250, nullable=false)
     */
    public $desc;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $photo;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $text;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $url;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $cat_id;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     * @return News
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $title
     * @return News
     */
    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }

    /**
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }

    /**
     * @param string $key
     * @return News
     */
    public function setKey($key)
    {
        $this->key = $key;
        return $this;
    }

    /**
     * @return string
     */
    public function getDesc()
    {
        return $this->desc;
    }

    /**
     * @param string $desc
     * @return News
     */
    public function setDesc($desc)
    {
        $this->desc = $desc;
        return $this;
    }

    /**
     * @return string
     */
    public function getPhoto()
    {
        return $this->photo;
    }

    /**
     * @param string $photo
     * @return News
     */
    public function setPhoto($photo)
    {
        $this->photo = $photo;
        return $this;
    }

    /**
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * @param string $text
     * @return News
     */
    public function setText($text)
    {
        $this->text = $text;
        return $this;
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
     * @return News
     */
    public function setDate($date)
    {
        $this->date = $date;
        return $this;
    }

    /**
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * @param string $url
     * @return News
     */
    public function setUrl($url)
    {
        $this->url = $url;
        return $this;
    }

    /**
     * @return int
     */
    public function getCatId()
    {
        return $this->cat_id;
    }

    /**
     * @param int $cat_id
     * @return News
     */
    public function setCatId($cat_id)
    {
        $this->cat_id = $cat_id;
        return $this;
    }



}
