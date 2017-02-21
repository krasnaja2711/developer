<?php

class Header
{

    function header(){

        $form = new LoginForm();
        $Categories = Category::find();

        $temp = [];
        foreach ($Categories as $category) {
            $temp[$category->getId()] = $category;
        }

        return ['form'=> $form,'ct' =>$temp];
    }

}