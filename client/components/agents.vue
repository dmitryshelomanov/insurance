<template>
	<div>
		<div class="container">
			<div class="row clearfix">
				<div class="block text-center" :class="'col-md-' + 12/countSlide"
					 v-for="(item, index) in agents"
					 v-show="index >= select && index < select + countSlide">
					<img :src="`${ipDomain}img/${item.img}`" alt="">
					<div class="text" v-substr="item.text ">
					</div>
					<div class="name">
						{{ item.name }}
					</div>
				</div>
			</div>
			<div class="row">
				<div>
					<i class="fa fa-chevron-left" @click="prev"></i>
					<i class="fa fa-chevron-right" @click="next"></i>
				</div>
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
				countSlide: 3,
				ipDomain: ''
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
				});
			this.ipDomain = ipDomain;
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