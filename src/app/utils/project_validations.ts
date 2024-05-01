import {AbstractControl } from "@angular/forms";

export class Project_Validations{
  static invalid_name(control: AbstractControl){
    const name = control.value;

    if (name == 'project' || name == 'death' || name == "kill"){
      return {name:true};
    }
    return null;
  }
}
