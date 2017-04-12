export	const ipDomain = 'http://diplomServer/'

export	const clientId = 2

export	const clientSecret = 'zuwZjwP2whDqGYytR3WYfXhaV3B19clL0QYLsGQi'

export	const getHeader = function() {
		let tokenData = JSON.parse(window.localStorage.getItem('authUser'));
		let header = null;
		if (tokenData !== null) {
			header = {
				'Accept': 'application/json',
				'Authorization': 'Bearer ' + tokenData.access_token
			}
		}
		return header;
	}
