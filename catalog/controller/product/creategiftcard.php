<?php
    class ControllerProductCreategiftcard extends Controller {
	private $error = array(); 
        public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('product/creategiftcard', '', 'SSL');
                        $this->redirect($this->url->link('product/creategiftcard', '', 'SSL'));
		}
                $this->language->load('product/creategiftcard');

		$this->document->setTitle($this->language->get('heading_title'));
		//$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		//$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
                $this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_creategiftcard'),
			'href'      => $this->url->link('product/creategiftcard', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
                $this->data['type'] = $this->customer->getCustomerType();
                $this->data['creategiftcard'] = $this->url->link('product/creategiftcard','','SSL');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['product'] = $this->url->link('product/product', 'product_id=50');
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/creategiftcard.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/creategiftcard.tpl';
		} else {
			$this->template = 'default/template/account/creategiftcard.tpl';
		}
                if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
                
                $this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);

		$this->response->setOutput($this->render());
    }
    }
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>