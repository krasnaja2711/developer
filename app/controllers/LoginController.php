<?php

class LoginController extends ControllerBase
{
public function errorAction(){
    $form = new LoginForm();
    $users = new Users();
    $this->view->setVars([
        'form' => $form,
        'users' => $users,
    ]);
    if (!$this->request->isPost()) {
        return $this->view;
    }
    $form->bind($_POST, $users);
    if ($form->isValid()) {
        $login = $this->request->getPost("login");
        $pass = $this->request->getPost("pass");
        $user = Users::findFirst([
            'conditions' => 'login = :login: and pass = :pass: and id_roles = 1',
            'bind' => [
                'login' => $login,
                'pass' => $pass,
            ]]);
        if ($user) {
            $authorization = 1;
            $this->session->set("authorization", $authorization);
            $this->session->set("login", $login);
            $url = $this->request->getPost("current_url");
            return $this->response->redirect($url);
        }
        $user = Users::findFirst([
            'conditions' => 'login = :login: and pass = :pass: and id_roles = 2',
            'bind' => [
                'login' => $login,
                'pass' => $pass,
            ]]);
        if ($user) {
            $authorization = 2;
            $this->session->set("authorization", $authorization);
            $this->session->set("login", $login);
            $url = $this->request->getPost("current_url");
            return $this->response->redirect($url);
        }

    }
}
    public function logoutAction()
    {
        $rememberMeCookie = $this->cookies->get("remember-me");
        $rememberMeCookie->delete();
        $this->session->destroy();
        $url = $pass = $this->request->getPost("current_url");
        $this->response->redirect($url);

    }
}