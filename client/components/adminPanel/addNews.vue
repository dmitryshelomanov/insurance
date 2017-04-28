<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
                <br>
				<label for="">Название</label>
				<input type="text" class="form-control" v-model="name"> <br>
                <div id="editNews"></div>
                <button class="btn btn-primary" @click="addNews()">добавить</button>
			</div>
		</div>
	</transition>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'
    import io from 'socket.io-client';

	export default {
		data () {
			return {
				denied: false,
                socket: null,
				name: ''
			}
		},
		methods: {
			close () {
				this.$emit('close');
			},
            addNews() {
				let data = {
					name: this.name,
					data: $('#editNews').summernote('code')
				};

				this.$http.post(`${ipDomain}api/news`, data, {
					headers: getHeader()
				}).then(response => {
					if (response.status === 200) {
						data.id = response.data;
						this.socket.emit('newsServer', data);
					}
				});
            }
		},
        mounted () {
			if (process.BROWSER_BUILD) {
                this.socket = io(':6001');
                
                $('#editNews').summernote({
                    height: 480
                });
			}

        }
	}
</script>

