import { Component } from '@angular/core';
import {MatCardModule} from '@angular/material/card';

//Button
import {FormGroup, FormControl, FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatButton} from "@angular/material/button";

//Calendar
import {JsonPipe} from '@angular/common';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatDatepickerToggle, MatDateRangeInput, MatDateRangePicker} from "@angular/material/datepicker";
import {provideNativeDateAdapter} from '@angular/material/core';
import {RouterLink, RouterLinkActive} from "@angular/router";

@Component({
  selector: 'app-project-preview',
  standalone: true,
  imports: [MatCardModule, MatFormFieldModule, FormsModule, ReactiveFormsModule,
    MatButton, MatDateRangeInput, MatDatepickerToggle, MatDateRangePicker, MatDatepickerModule,
    FormsModule, ReactiveFormsModule, JsonPipe, RouterLink, RouterLinkActive],
  providers: [provideNativeDateAdapter()],
  templateUrl: './project_preview.component.html',
  styleUrl: './project_preview.component.css'
})
export class ProjectPreviewComponent {
  range = new FormGroup({
    start: new FormControl<Date | null>(null),
    end: new FormControl<Date | null>(null),
  });

  constructor() { }

}

