import { Component } from '@angular/core';
import {ProjectPreviewComponent} from "../project_preview/project_preview.component";
import {ProjectDetailsComponent} from "../project_details/project_details.component";
import {ProjectCreationComponent} from "../project_creation/project_creation.component";

@Component({
  selector: 'app-project-menu',
  standalone: true,
  imports: [
    ProjectPreviewComponent,
    ProjectDetailsComponent,
    ProjectCreationComponent
  ],
  templateUrl: './project_menu.component.html',
  styleUrl: './project_menu.component.css'
})
export class ProjectMenuComponent {

}
