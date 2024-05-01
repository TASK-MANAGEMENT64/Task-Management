import { Component, OnInit } from '@angular/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import esLocale from '@fullcalendar/core/locales/es';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrl: './calendar.component.css'
})
export class CalendarComponent implements OnInit{

  public events: any[];
  public options: any;

  constructor() {
  }

  ngOnInit() {

    this.options ={
      plugins: [dayGridPlugin,timeGridPlugin, interactionPlugin],
      defaultDate: new Date(),
      locale: esLocale,
      header: {
        left: 'prev, next',
        center: 'title',
        right: 'dayGridMonth, timeGridWeek,timeGridDay'
      },
      editable: false
    }

    this.events = [
      {
        title: "Desarrollo de Aplicaciones Open Source",
        start: new Date(),
        description: "19:00 - 22:00"
      }
    ]
  }
}
