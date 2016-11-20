<h3><i>{{ temaTitle }}</i></h3>
<div id="temas">
  <input v-model="editTema"
       v-show="temaSelected.id"
       class="input-text"
       id="edit-tema"
       data-id=""
       @keyup.enter="actualizarTema(temaSelected)">
  <input v-model="newTema"
       v-show="semanaSelected.id && !(temaSelected.id)"
       class="input-text"
       placeholder="Ingrese el nuevo tema"
       id="new-tema"
       @keyup.enter="addTema()">
  <div v-show="semanaSelected.id && !(temaSelected.id)">
    <label><input type="radio" v-model="newTemaTipo" value="1">Teoria</label>&nbsp;
    <label><input type="radio" v-model="newTemaTipo" value="2">Practica</label>&nbsp;
    <label><input type="radio" v-model="newTemaTipo" value="3">Labo</label>
  </div>
  <div v-show="temaSelected.id">
    <label><input type="radio" v-model="editTemaTipo" value="1">Teoria</label>&nbsp;
    <label><input type="radio" v-model="editTemaTipo" value="2">Practica</label>&nbsp;
    <label><input type="radio" v-model="editTemaTipo" value="3">Labo</label>
  </div>
  <a class="btn btn-success"
     v-show="semanaSelected.id && !(temaSelected.id)"
     title="Agregar Tema"
     v-show="!temaSelected.id"
     @click="addTema()"
     >
    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
  </a>
  <a class="btn btn-default"
     v-show="temaSelected.id"
     @click="actualizarTema(temaSelected)">
     <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
  </a>
  <a class="btn btn-warning"
     v-show="temaSelected.id"
     @click="cancelarActualizar()">
     <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
  </a>
  <div class="clickable tema"
     id="tema_div_{{ tema.id }}"
     v-for="tema in temasSemanaSelected(semanaSelected)"
  >
    <p id="tema_{{ tema.id }}"
       @click="addBinding(tema)" >
      <span>{{ tema.name }}</span>
      <a type="button"
         class="btn btn-danger float-right"
         v-show="temaSelected == tema"
         title="Eliminar"
         @click="deleteTema(tema)"
      >
        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
      </a>
    </p>
  </div>
</div>