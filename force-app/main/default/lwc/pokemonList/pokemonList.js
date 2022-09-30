import { NavigationMixin } from 'lightning/navigation';
import { LightningElement, wire } from 'lwc';
/** PokemonController.searchPokemons(searchTerm) Apex method */
import searchPokemons from '@salesforce/apex/PokemController.searchPokemons';
export default class PokemonList extends NavigationMixin(LightningElement) {
	searchTerm = '';
	generacion = 0;
	tipo = 'Todos';
	@wire(searchPokemons, { searchTerm: '$searchTerm', generacion: '$generacion', tipo: '$tipo' }) pokemons;

	handleSearchTermChange (event) {
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		this.delayTimeout = setTimeout(() => {
			this.searchTerm = searchTerm;
		}, 100)
	}
	handlePokemonView (event) {
		const pokemonId = event.detail;
		this[NavigationMixin.Navigate]({
			type: 'standard__recordPage',
			attributes: {
				recordId: pokemonId,
				objectApiName: 'Pokemon__c',
				actionName: 'view',
			},
		})
	}
	get getTipo () {
		return (this.tipo == 'Todos')
	}
	get getGen () {
		return (this.generacion == '0')
	}
	get hasResults () {
		console.log(this.pokemons);
		return (this.pokemons.data.length > 0);
	}

	//value2 = '0';
	get optionsGen () {
		return [
			{ label: 'Todos', value: '0' },
			{ label: '1', value: '1' },
			{ label: '2', value: '2' },
			{ label: '3', value: '3' },
			{ label: '4', value: '4' },
			{ label: '5', value: '5' },
			{ label: '6', value: '6' },
			{ label: '7', value: '7' },
			{ label: '8', value: '8' },
		];
	}

	handleChangeGen (event) {
		this.value2 = event.detail.value;
		this.generacion = event.detail.value;
	}

	//value1 = 'Todos';
	get optionsTipo () {
		return [
			{ label: 'Todos', value: 'Todos' },
			{ label: 'Normal', value: 'Normal' },
			{ label: 'Fighting', value: 'Fighting' },
			{ label: 'Flying', value: 'Flying' },
			{ label: 'Poison', value: 'Poison' },
			{ label: 'Ground', value: 'Ground' },
			{ label: 'Rock', value: 'Rock' },
			{ label: 'Bug', value: 'Bug' },
			{ label: 'Ghost', value: 'Ghost' },
			{ label: 'Steel', value: 'Steel' },
			{ label: 'Fire', value: 'Fire' },
			{ label: 'Water', value: 'Water' },
			{ label: 'Grass', value: 'Grass' },
			{ label: 'Electric', value: 'Electric' },
			{ label: 'Psychic', value: 'Psychic' },
			{ label: 'Ice', value: 'Ice' },
			{ label: 'Dragon', value: 'Dragon' },
			{ label: 'Dark', value: 'Dark' },
			{ label: 'Fairy', value: 'Fairy' }
		];
	}

	handleChangeTipo (event) {
		this.value1 = event.detail.value;
		this.tipo = event.detail.value;
	}

	handleChangeTipo(event) {
		window.clearTimeout(this.delayTimeout);
		const tipo = event.target.value;
		//eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
		  this.tipo = tipo;
		}, 300);
	  }
}