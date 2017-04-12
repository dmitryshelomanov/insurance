<template>
	<div>
		<my-header/>
		<nuxt/>
		<my-footer/>
		<panel v-if="authUser.auth && authUser.data.data.role == 0"/>
		<admin-panel v-if="authUser.auth && authUser.data.data.role == 1 || authUser.data.data.role == 2"/>
		<push/>
	</div>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		mounted () {
			if (process.BROWSER_BUILD) {
				let data = JSON.parse(window.localStorage.getItem('authUser'))
				this.$store.commit('userStore/SET_AUTH_USER', data)
			}
		},
		computed: {
			authUser () {return this.$store.state.userStore.authUser}
		},
		components: {
			myHeader: require('~/components/header.vue'),
			myFooter: require('~/components/footer.vue'),
			panel: require('~/components/panel/index.vue'),
			push: require('~/components/push.vue'),
			adminPanel: require('~/components/adminPanel/index.vue'),
		}
	}
</script>