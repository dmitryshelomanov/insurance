<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="block text-center" :class="'col-lg-' + 12/countSlide"
					 v-for="(item, index) in agents"
					 v-show="index >= select && index < select + countSlide">
					<img src="/img/face3.jpg" alt="">
					<div class="text" v-substr="item.text ">
					</div>
					<div class="name">
						{{ item.name }}
					</div>
				</div>
				<p>
					<i class="fa fa-chevron-left" @click="prev"></i>
					<i class="fa fa-chevron-right" @click="next"></i>
				</p>
			</div>
		</div>
	</div>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				agents: [],
				select: 0,
				countSlide: 3
			}
		},
		methods: {
			next () {
				if (this.select * this.countSlide <= this.agents.length) {
					this.select++
				}
			},
			prev () {
				if (this.select !== 0) {
					this.select--
				}
			}
		},
		mounted () {
			this.$http.get(ipDomain + 'api/agents')
				.then(response => {
					if (response.status === 200) {
						this.agents = response.data
					}
				})
		}
	}
</script>

<style scoped>
	.block {
		margin-bottom: 15px
	}
	.text {
		color: #fff;
	}
	.name {
		font-weight: bold;
	}
	i {
		padding: 15px;
		cursor: pointer;
	}
</style>