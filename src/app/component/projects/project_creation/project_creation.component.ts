import { Component } from '@angular/core';
import {MatCardModule} from '@angular/material/card';

//Inputs
import {takeUntilDestroyed} from '@angular/core/rxjs-interop';
import {FormGroup, FormControl, Validators, FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';
import {merge} from 'rxjs';
import {MatButton} from "@angular/material/button";
import {Project_Validations} from "../../../utils/project_validations";
import {MatDatepickerToggle, MatDateRangeInput, MatDateRangePicker} from "@angular/material/datepicker";

//Calendar
import {JsonPipe} from '@angular/common';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {provideNativeDateAdapter} from '@angular/material/core';

//Dialog
import {MatDialog, MatDialogActions, MatDialogClose, MatDialogContent, MatDialogTitle,} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {RouterLink, RouterLinkActive} from "@angular/router";

@Component({
  selector: 'app-project-creation',
  standalone: true,
  imports: [MatCardModule, MatFormFieldModule, MatInputModule, FormsModule, ReactiveFormsModule,
    MatButton, MatDateRangeInput, MatDatepickerToggle, MatDateRangePicker, MatDatepickerModule,
    FormsModule, ReactiveFormsModule, JsonPipe, MatButtonModule ],
  providers: [provideNativeDateAdapter()],
  templateUrl: './project_creation.component.html',
  styleUrl: './project_creation.component.css'
})


export class ProjectCreationComponent {
  project_name = new FormControl('', [Validators.required, Project_Validations.invalid_name]);

  errorMessage = '';

  range = new FormGroup({
    start: new FormControl<Date | null>(null),
    end: new FormControl<Date | null>(null),
  });

  constructor(public dialog: MatDialog) {
    merge(this.project_name.statusChanges, this.project_name.valueChanges)
      .pipe(takeUntilDestroyed())
      .subscribe(() => this.updateErrorMessage());
  }

  updateErrorMessage() {
    if (this.project_name.hasError('required')) {
      this.errorMessage = 'You must enter a value';
    } else if (this.project_name.hasError('name')) {
      this.errorMessage = 'Invalid Name';
    }
    else {
      this.errorMessage = '';
    }
  }

  //Dialog
  openDialog() {
    this.dialog.open(ProjectCreateDialog);
  }

}

@Component({
  selector: 'create_project.dialog',
  templateUrl: 'dialogs/create_project_dialog.html',
  standalone: true,
  imports: [MatDialogTitle, MatDialogContent, MatDialogActions, MatDialogClose, MatButtonModule, RouterLink, RouterLinkActive],
})
export class ProjectCreateDialog {}
