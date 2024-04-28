import { Routes } from '@angular/router';
import {ProjectPreviewComponent} from "./component/projects/project_preview/project_preview.component";
import {ProjectCreationComponent} from "./component/projects/project_creation/project_creation.component";
import {ProjectDetailsComponent} from "./component/projects/project_details/project_details.component";
import {ProjectMenuComponent} from "./component/projects/project_menu/project_menu.component";

export const routes: Routes = [
  { path: '', redirectTo: '/project_menu', pathMatch: 'full' },

  { path: 'project_preview', component: ProjectPreviewComponent},
  { path: 'project_creation', component: ProjectCreationComponent},
  { path: 'project_details', component: ProjectDetailsComponent},
  { path: 'project_menu', component: ProjectMenuComponent},
];
