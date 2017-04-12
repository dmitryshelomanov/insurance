export const state = {
	authUser: {
		auth: false,
		data: {
			data: {
				id: 0,
				name: null,
				role: 0,
				img: null
			}
		}
	}
}

export const mutations = {
	SET_AUTH_USER (state, userObj) {
		if (userObj == null) {
			state.authUser.auth = false
			state.authUser.data.data = {id: 0,name: null, role: 0, access_token: null}
		} else {
			state.authUser.data = userObj
			state.authUser.auth = true
		}
	}
}
