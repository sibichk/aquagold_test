<?php
class ControllerAccountSearch extends Controller {
	private $error = array();
	
	public function index() {
		/*if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/search', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}*/

		//$this->language->load('account/reward');

		$this->document->setTitle('Find a Doctor');
		
		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$code = $this->request->post['zip'];
		} else {
			$code = '';
		}
		
		$this->data['code'] = $code;

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => 'Home',
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		/*$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);*/

		$this->data['breadcrumbs'][] = array(
			'text'      => 'Find a Doctor',
			'href'      => $this->url->link('account/search', '', 'SSL'),
			'separator' => '&raquo; '
		);

		$this->data['heading_title'] = 'Find a Doctor';

		//$this->data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}		

		$this->data['customers'] = array();

		/*$data = array(				  
			'sort'  => 'date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * 10,
			'limit' => 10
		);*/

		$customer_total = $this->model_account_customer->getTotalCustomersByZip($code);

		$results = $this->model_account_customer->getCustomerByZip($code);

		$this->data['city'] = '';
		
		foreach ($results as $result) {
			if($result['postcode'] == $code) {
				$this->data['customers'][] = array(
					'customer_id'    => $result['customer_id'],
					'firstname'      => $result['firstname'],
					'lastname'       => $result['lastname'],
					'name'           => $result['name'],
					'discount'       => $result['discount'],
					'date_end'       => $result['date_end'],
					'address_1'      => $result['address_1'],
					'address_2'      => $result['address_2'],
					'city'           => $result['city'],
					'state'          => $result['state'],
					'member'         => $result['member'],
					'postcode'       => $result['postcode']
				);
				
				$this->data['city'] = $result['city'];
			}
		}
		
		foreach ($results as $result) {
			if($result['postcode'] != $code) {
				$this->data['customers'][] = array(
					'customer_id'    => $result['customer_id'],
					'firstname'      => $result['firstname'],
					'lastname'       => $result['lastname'],
					'name'           => $result['name'],
					'discount'       => $result['discount'],
					'date_end'       => $result['date_end'],
					'address_1'      => $result['address_1'],
					'address_2'      => $result['address_2'],
					'city'           => $result['city'],
					'state'          => $result['state'],
					'member'         => $result['member'],
					'postcode'       => $result['postcode']
				);
			}
		}	

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = 10; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/search', 'page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['continue'] = $this->url->link('common/home', '', 'SSL');
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['search'] = $this->url->link('information/tellafriend', '', 'SSL');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['type'] = $this->customer->getCustomerType();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/find_physician.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/find_physician.tpl';
		} else {
			$this->template = 'default/template/account/find_physician.tpl';
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
	
	protected function validate() {
		$code = $this->request->post['zip'];
		
		if (!isset($code)) {
			$this->error['warning'] = 'Please enter zip code';
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	// search autofill
	//<![CDATA[
	public function ajax()
	{
		// Contains results
		$data = array();
		if( isset($this->request->get['keyword']) ) {
			// Parse all keywords to lowercase
			$keywords = strtolower( $this->request->get['keyword'] );
			// Perform search only if we have some keywords
			if( strlen($keywords) >= 2 ) {
				$parts = explode( ' ', $keywords );
				$add = '';
				// Generating search
				foreach( $parts as $part ) {
					$add .= ' AND (LOWER(firstname) LIKE "%' . $this->db->escape($part) . '%"';
					$add .= ' OR LOWER(lastname) LIKE "%' . $this->db->escape($part) . '%")';
				}
				$add = substr( $add, 4 );
				$sql  = 'SELECT * FROM ' . DB_PREFIX . 'customer ';
				$sql .= 'WHERE ' . $add . ' AND status = 1 AND customer_type = 1 ';
				$sql .= ' ORDER BY LOWER(firstname) ASC, LOWER(lastname) ASC';
				$sql .= ' LIMIT 15';
				/*foreach( $parts as $part ) {
					$add .= ' AND (LOWER(pd.name) LIKE "%' . $this->db->escape($part) . '%"';
					$add .= ' OR LOWER(p.model) LIKE "%' . $this->db->escape($part) . '%")';
				}
				$add = substr( $add, 4 );
				$sql  = 'SELECT pd.product_id, pd.name, p.model FROM ' . DB_PREFIX . 'product_description AS pd ';
				$sql .= 'LEFT JOIN ' . DB_PREFIX . 'product AS p ON p.product_id = pd.product_id ';
				$sql .= 'LEFT JOIN ' . DB_PREFIX . 'product_to_store AS p2s ON p2s.product_id = pd.product_id ';
				$sql .= 'WHERE ' . $add . ' AND p.status = 1 ';
				$sql .= 'AND pd.language_id = ' . (int)$this->config->get('config_language_id');
				$sql .= ' AND p2s.store_id =  ' . (int)$this->config->get('config_store_id'); 
				$sql .= ' ORDER BY p.sort_order ASC, LOWER(pd.name) ASC, LOWER(p.model) ASC';
				$sql .= ' LIMIT 15';*/
				$res = $this->db->query( $sql );
				if( $res ) {
					$data = ( isset($res->rows) ) ? $res->rows : $res->row;
	
					// For the seo url stuff
					//$basehref = 'product/product&keyword=' . $this->request->get['keyword'] . '&product_id=';
					foreach( $data as $key => $values ) {
						$data[$key] = array(
							'name' => htmlspecialchars_decode($values['firstname'] . ' ' . $values['lastname'], ENT_QUOTES),
							//'href' => $this->url->link($basehref . $values['customer_id'])
						);
					}
				}
			}
		}
		echo json_encode( $data );
	}
	//]]>
	// end search auto fill 		
}
?>