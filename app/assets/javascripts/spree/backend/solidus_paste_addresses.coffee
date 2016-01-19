window.PasteAddresses =
	handleChange: () ->
		$el = $(this)
		text = $el.val()

		if (!text)
			return

		req = Spree.ajax
			type: 'GET',
			url: '/api/addresses/parse',
			headers: {"X-Spree-Token": Spree.api_key},
			data: {text: text}

		req.done (address) ->
			$el.parent().parent().find('[name*="firstname"]').val(address.firstname);
			$el.parent().parent().find('[name*="lastname"]').val(address.lastname);
			$el.parent().parent().find('[name*="address1"]').val(address.address1);
			$el.parent().parent().find('[name*="company"]').val(address.company);
			$el.parent().parent().find('[name*="city"]').val(address.city);
			$el.parent().parent().find('[name*="zipcode"]').val(address.zipcode);
			$el.parent().parent().find('[name*="phone"]').val(address.phone);

		req.always () ->
			$el.val("")
