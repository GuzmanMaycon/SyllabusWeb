window.Laravel = "";
var vm = new Vue(
{
    el: '#app',

    data: {
        unidades: [],
        semanas: [],
        temas: [],
        refBibliografica: [],

        unidadSelected: {},
        semanaSelected: {},
        temaSelected: {},
        ref_selected: {},

        lastUnidadId: 0,
        lastSemanaId: 0,
        lastTemaId: 0,
        lastRefId: 0,

        see_preview: false,
        maxUnidades: 5,
        maxSemanas: 17,
        maxSemanasPorUnidad: 5,

        newTema: '',
        newTemaTipo: '',
        editTema: '',
        editTemaTipo: '',

        newRefAutor: '',
        newRefAnio: '',
        newRefTitulo: '',
        newRefEditorial: '',
        newRefIsbn: '',
        newRefLugar: '',

        editRefAutor: '',
        editRefAnio: '',
        editRefTitulo: '',
        editRefEditorial: '',
        editRefIsbn: '',
        editRefLugar: '',

        temaTitle: '',
    },

    methods: {
       //Unidades
       selectUnidad: function(unidad) {
            var last_unidad = document.getElementById('unidad_' + this.unidadSelected.id)
            var unidad_element = document.getElementById('unidad_' + unidad.id)

            if (this.unidadSelected.id == undefined) {
                unidad_element.className += ' unidad-selected'
                this.unidadSelected = unidad
            } else {
                if (this.unidadSelected.id == unidad.id) {
                    unidad_element.className = 'clickable unidad'
                    this.unidadSelected = {}
                } else {
                    last_unidad.className = 'clickable unidad'
                    unidad_element.className += ' unidad-selected'
                    this.unidadSelected = unidad
                }
            }
            this.semanaSelected = {}
            this.temaSelected = {}
        },
        addUnidad: function() {
            var new_id = ++this.lastUnidadId
            var len_unidades = this.unidades.length
            if (len_unidades < this.maxUnidades)
                this.unidades.push({
                    id: new_id,
                    number: (len_unidades + 1)
                })
            else
                alert("Muchas unidades")
        },
        deleteUnidad: function(unidad) {
            this.semanasUnidadSelected(unidad).forEach(function(semana, index){
                vm.deleteSemana(semana)
            })
            this.unidades.forEach(function(elemento, index, array){
                if (elemento.id == unidad.id)
                    array.splice(index, 1)
            })

            this.unidades.forEach(function(elemento, index){
                elemento.number = (index + 1)
            })

            this.unidadSelected = {}
        },
        //Semanas
        selectSemana: function(semana) {
            var last_semana = document.getElementById('semana_' + this.semanaSelected.id)
            var semana_element = document.getElementById('semana_' + semana.id)

            if (this.semanaSelected.id == undefined) {
                semana_element.className += ' semana-selected'
                this.semanaSelected = semana
            } else {
                if (this.semanaSelected.id == semana.id) {
                    semana_element.className = 'clickable semana'
                    this.semanaSelected = {}
                } else {
                    last_semana.className = 'clickable semana'
                    semana_element.className += ' semana-selected'
                    this.semanaSelected = semana
                }
            }
            this.temaSelected = {}
        },
        addSemana: function() {
            var new_id = ++this.lastSemanaId
            var len_semanas = this.semanas.length
            if (len_semanas < this.maxSemanas) {
                var unidad = this.unidadSelected
                var len_semanas_por_unidad = this.semanas.reduce(function(total,semana){
                    return semana.unidadId == unidad.id ? total+1 : total
                }, 0)

                if (len_semanas_por_unidad < this.maxSemanasPorUnidad) {
                    this.semanas.push({
                        id: new_id,
                        number: (len_semanas + 1),
                        unidadId: this.unidadSelected.id
                    })

                    var semanas = this.semanas
                    var semanas_por_unidades = []
                    this.unidades.forEach(function(unidad, i) {
                        semanas_por_unidades[i] = semanas.reduce(function(total,semana){
                            return semana.unidadId == unidad.id ? total+1 : total
                        }, 0)
                    })

                    var start = 0
                    this.unidades.forEach(function(unidad, i){
                        var end = start + semanas_por_unidades[i]
                        for (; start < end; start++) {
                            semanas[start].unidadId = unidad.id
                        }
                    })
                }
                else
                    alert("Muchas semanas en una unidad")
            }
            else
                alert("Muchas semanas")
        },
        deleteSemana: function(semana) {
            this.temasSemanaSelected(semana).forEach(function(tema, index){
                vm.deleteTema(tema)
            })
            this.semanas.forEach(function(elemento, index, array){
                if (elemento.id == semana.id)
                    array.splice(index, 1)
            })

            this.semanas.forEach(function(elemento, index){
                elemento.number = (index + 1)
            })

            this.semanaSelected = {}
        },
        //Temas
        selectTema: function(tema) {
            var last_tema = document.getElementById('tema_div_' + this.temaSelected.id)
            var tema_element = document.getElementById('tema_div_' + tema.id)

            if (this.temaSelected.id == undefined) {
                tema_element.className += ' tema-selected'
                this.temaSelected = tema
            } else {
                if (this.temaSelected.id == tema.id) {
                    tema_element.className = 'clickable tema'
                    this.temaSelected = {}
                } else {
                    last_tema.className = 'clickable tema'
                    tema_element.className += ' tema-selected'
                    this.temaSelected = tema
                }
            }
        },
        addTema: function() {
            this.temas.push({
                id: (++this.lastTemaId)+"",
                name: this.newTema,
                semanaId: this.semanaSelected.id+"",
                semana: this.semanaSelected.number+"",
                unidad: this.unidadSelected.number+"",
                tipoId: this.newTemaTipo+""
            });
            this.newTema = '';
            this.newTemaTipo = 1;
            document.getElementById('new-tema').focus();
        },
        deleteTema: function(tema) {
            this.temas.forEach(function(elemento, index, array){
                if (elemento.id == tema.id)
                    array.splice(index, 1)
            })

            this.temaSelected = {}
        },
        actualizarTema: function(tema) {
           var tema_filtered = this.temas.filter(function(elemento){
               return tema.id == elemento.id;
           })[0];
           tema_filtered.name = this.editTema;
           tema_filtered.tipoId = this.editTemaTipo;
           this.editTema = '';
           this.editTemaTipo = '';
           this.cancelarActualizar();
        },
        cancelarActualizar: function() {
           this.selectTema(this.temaSelected)
           this.temaSelected = {}
        },
        semanasUnidadSelected: function(unidad) {
            return this.semanas.filter(function(semana){
                return semana.unidadId == unidad.id
            })
        },
        temasSemanaSelected: function(semana) {
            return this.temas.filter(function(tema){
                return tema.semanaId == semana.id
            })
        },
        addBinding: function(tema) {
            document.getElementById('edit-tema').dataset.id = tema.id;
            this.selectTema(tema);
            this.editTema = tema.name;
            this.editTemaTipo = tema.tipoId;
        },
        //Bibliografia
        selectRef: function(ref) {
            var last_ref = document.getElementById('ref_' + this.ref_selected.id)
            var ref_element = document.getElementById('ref_' + ref.id)

            if (this.ref_selected.id == undefined) {
                ref_element.className += ' ref-selected'
                this.ref_selected = ref
            } else {
                if (this.ref_selected.id == ref.id) {
                    ref_element.className = 'clickable ref'
                    this.ref_selected = {}
                } else {
                    last_ref.className = 'clickable ref'
                    ref_element.className += ' ref-selected'
                    this.ref_selected = ref
                }
            }
        },
        addBindingRef: function(ref) {
            this.selectRef(ref)
            this.editRefAutor = ref.author
            this.editRefAnio = ref.year
            this.editRefTitulo = ref.title
            this.editRefEditorial = ref.editorial
            this.editRefIsbn = ref.isbn
            this.editRefLugar = ref.lugar
        },
        addRefBibliografica: function() {
            if (this.newRefAutor != "" &&
                this.newRefAnio != "" &&
                this.newRefAnio > 1900 &&
                this.newRefAnio < 2016 &&
                this.newRefTitulo != ""
                ) {
                this.refBibliografica.push({
                    id: (++this.lastRefId)+"",
                    author: this.newRefAutor,
                    year: this.newRefAnio+"",
                    title: this.newRefTitulo,
                    editorial: this.newRefEditorial,
                    isbn: this.newRefIsbn,
                    lugar: this.newRefLugar
                })
                this.newRefAutor = ''
                this.newRefAnio = ''
                this.newRefTitulo = ''
                this.newRefEditorial = ''
                this.newRefIsbn = ''
                this.newRefLugar = ''
                document.getElementById('newRefAutor').focus();
            } else {
                alert("Ingrese campos validos")
            }
        },
        deleteRefBibliografica: function(ref) {
            this.refBibliografica.forEach(function(elemento, index, array){
                if (elemento.id == ref.id)
                    array.splice(index, 1)
            })
        },
        actualizarRef: function(ref) {
            var refFiltered = this.refBibliografica.filter(function(elemento){
                return ref.id == elemento.id
            })[0]
            refFiltered.year = this.editRefAnio
            refFiltered.author = this.editRefAutor
            refFiltered.title = this.editRefTitulo
            refFiltered.editorial = this.editRefEditorial
            refFiltered.isbn = this.editRefIsbn
            refFiltered.lugar = this.editRefLugar
            this.editRefAutor = ''
            this.editRefTitulo = ''
            this.editRefAnio = ''
            this.editRefEditorial = ''
            this.editRefIsbn = ''
            this.editRefLugar = ''
            this.cancelarActualizarRef()
        },
        cancelarActualizarRef: function(ref) {
            this.selectRef(this.ref_selected)
            this.ref_selected = {}
        },
        //Submit
        onSubmit: function() {
           var form = document.getElementById("syllabusForm")

           this.temas.forEach(function(tema, index){
              var input = document.createElement("input")
              input.type = "hidden"
              input.name = "temas[]"
              input.value = JSON.stringify(tema)

              form.appendChild(input)
           })

           this.refBibliografica.forEach(function(ref, index){
              var input = document.createElement("input")
              input.type = "hidden"
              input.name = "bibliografia[]"
              input.value = JSON.stringify(ref)

              form.appendChild(input)
           })

           form.submit()
        }
    },

    watch: {
        semanaSelected: function(newValue)
        {
            if (newValue.id == undefined)
                this.temaTitle = ''
            else
                this.temaTitle = 'Temas - Unidad ' + this.unidadSelected.number + ' - Semana' + this.semanaSelected.number
        }
    },

    ready: function() {
       if (window.unidades.length > 0) {
          this.unidades = window.unidades;
          this.lastUnidadId = window.lastUnidadId;
          this.semanas = window.semanas;
          this.lastSemanaId = window.lastSemanaId;
          this.temas = window.temas;
          this.lastTemaId = window.lastTemaId;
          this.lastRefId = window.lastRefId;
          this.refBibliografica = window.bibliografia;
       }
       this.newTemaTipo = 1;
    }
});