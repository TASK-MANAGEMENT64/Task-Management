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
import {MatDialog, MatDialogActions, MatDialogClose,
  MatDialogContent, MatDialogTitle} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {MatList, MatListItem} from "@angular/material/list";
import {MatDivider} from "@angular/material/divider";
import {RouterLink, RouterLinkActive} from "@angular/router";

@Component({
  selector: 'app-project-details',
  standalone: true,
  imports: [MatCardModule, MatFormFieldModule, MatInputModule, FormsModule, ReactiveFormsModule,
    MatButton, MatDateRangeInput, MatDatepickerToggle, MatDateRangePicker, MatDatepickerModule,
    FormsModule, ReactiveFormsModule, JsonPipe, MatButtonModule, RouterLink, RouterLinkActive],
  providers: [provideNativeDateAdapter()],
  templateUrl: './project_details.component.html',
  styleUrl: './project_details.component.css'
})
export class ProjectDetailsComponent {
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
  openAddMemberDialog() {
    this.dialog.open(ChooseMemberDialog);
  }

}

@Component({
  selector: 'choose_member_dialog',
  templateUrl: 'dialogs/choose_member_dialog.html',
  standalone: true,
  imports: [MatDialogTitle, MatDialogContent, MatDialogActions,
    MatDialogClose, MatButtonModule, MatList, MatListItem, MatDivider],
})
export class ChooseMemberDialog {
  constructor(public dialog: MatDialog) {}
  openChooseMemberDialog() {
    this.dialog.open(AddMemberDialog);
  }

}

@Component({
  selector: 'add_member_dialog',
  templateUrl: 'dialogs/add_member_dialog.html',
  standalone: true,
  imports: [MatDialogTitle, MatDialogContent, MatDialogActions, MatDialogClose, MatButtonModule],
})
export class AddMemberDialog {}


