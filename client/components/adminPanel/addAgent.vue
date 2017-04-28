<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<div class="alert bg-danger text-danger" v-if="denied">
					У вас нет прав доступа !
				</div>
				<div class="alert text-success bg-success" v-if="success">
					{{ success.data }}
				</div>
				<div class="alert bg-danger text-danger" v-if="errors.length > 0">
					<ul>
						<li v-for="item in errors">{{ item }}</li>
					</ul>
				</div>

				<h5>Добавить агента</h5>
				<div class="form-group">
					<label for="">Имя</label>
					<input type="text" class="form-control" v-model="agent.name">
				</div>
				<div class="form-group">
					<label for="">Телефон</label>
					<input type="number" class="form-control" v-model="agent.phone">
				</div>
				<div class="form-group">
					<label for="">Фото</label>
					<input type="file" @change="upload">
					<img ref="output">
				</div>
				<div class="form-group">
					<label for="">Описание</label>
					<textarea class="form-control"rows="5" v-model="agent.text"></textarea>
				</div>
				<button class="btn btn-primary" @click="addAgent">
					<i class="fa fa-plus"></i> добавить
				</button>
			</div>
		</div>
	</transition>
</template>

<style scoped>
	img {
		max-width: 300px;
		max-heigth: 300px;
		margin: 10px
	}
</style>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				success: false,
				agent: {
					name: '',
					phone: '',
					text: '',
					img: ''
				},
				denied: false,
				errors: []
			}
		},
		methods: {
			close() {
				this.$emit('close')
			},
			addAgent() {
				this.$validatores6.make(this.agent, {
					'name.имя': 'required',
					'phone.телефон': 'required',
					'text.текст': 'required',
					'img.фото': 'required'
				});
				if (this.$validatores6.fails()) {
					this.errors = this.$validatores6.getError;
					return;
				}
				this.$http.post(`${ipDomain}api/add/agent`, this.agent, {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.success = response.data;
							this.errors = [];
						}
					}, error => {
						if (error.status === 401) {
							this.denied = true;
						}
					})
			},
			upload(e) {
				this.$refs.output.src = "/img/uploader.gif";

				let data = new FormData();

				data.append('photo', e.target.files[0]);

				this.$http.post(`${ipDomain}api/image/upload`, data, {headers: getHeader()})
				.then(response => {
					this.agent.img = response.data;
					this.reader(e.target.files[0])
				}, error => {
					this.$refs.output.src = "/img/warning.png";
				});
			},
			reader(img) {
				let reader = new FileReader();
				reader.onload = () => {
					let dataURL = reader.result;
					this.$refs.output.src = dataURL;
				};
				reader.readAsDataURL(img);
			}
		}
	}
</script>