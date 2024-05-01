import { Component } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { CardModule } from 'primeng/card';

@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [MatCardModule, CardModule, MatDividerModule, MatButtonModule],
  templateUrl: './tasks.component.html',
  styleUrl: './tasks.component.css',
})
export class TasksComponent {}
