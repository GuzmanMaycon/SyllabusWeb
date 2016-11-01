<h3><i>{{ tema_title }}</i></h3>
<div id="temas">
    <input v-model="edit_tema"
           v-show="tema_selected.id"
           class="input-text"
           id="edit-tema"
           data-id=""
           @keyup.enter="actualizar_tema(tema_selected)">
    <input v-model="new_tema"
           v-show="semana_selected.id && !(tema_selected.id)"
           class="input-text"
           placeholder="Ingrese el nuevo tema"
           id="new-tema"
           @keyup.enter="add_tema()">
    <a class="btn btn-success"
       v-show="semana_selected.id && !(tema_selected.id)"
       title="Agregar Tema"
       v-show="!tema_selected.id"
       @click="add_tema()"
       >
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
    </a>
    <a class="btn btn-default"
       v-show="tema_selected.id"
       @click="actualizar_tema(tema_selected)">
       <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
    </a>
    <a class="btn btn-warning"
       v-show="tema_selected.id"
       @click="cancelar_actualizar()">
       <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
    </a>
    <div class="clickable tema"
         id="tema_div_{{ tema.id }}"
         v-for="tema in temasSemanaSelected(semana_selected)"
    >
        <p id="tema_{{ tema.id }}"
           @click="add_binding(tema)" >
            <span>{{ tema.name }}</span>
            <a type="button"
               class="btn btn-danger float-right"
               v-show="tema_selected == tema"
               title="Eliminar"
               @click="delete_tema(tema)"
            >
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </a>
        </p>
    </div>
</div>