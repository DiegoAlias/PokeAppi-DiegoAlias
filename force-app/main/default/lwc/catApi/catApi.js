import { LightningElement, wire,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import returnCat from '@salesforce/apex/catAPI.returnCat';

export default class Parenthooks extends LightningElement {
  @wire(returnCat)returnCatVar;

  @track clickedButtonLabel = 'Show';  
    @track boolVisible = false;  
  
    handleClick(event) {  
        const label = event.target.label;  
  
        if ( label === 'Show' ) {  
  
            this.clickedButtonLabel = 'Hide';  
            this.boolVisible = true;  
  
        } else if  ( label === 'Hide' ) {  
              
            this.clickedButtonLabel = 'Show';  
            this.boolVisible = false;  
  
        }  
    }  
}
