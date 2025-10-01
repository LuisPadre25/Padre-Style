/* Data Display Components */

/* Table Component - Modern responsive table */
component Table {
  property children : Array(Html) = []
  property striped : Bool = false
  property hoverable : Bool = true
  property size : String = "md"

  style table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
  }

  style small {
    font-size: 0.875rem;
  }

  style large {
    font-size: 1.125rem;
  }

  fun render : Html {
    <table::table class={size}>
      for child of children {
        child
      }
    </table>
  }
}

component TableHeader {
  property children : Array(Html) = []

  style header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-size: 0.875rem;
  }

  fun render : Html {
    <thead::header>
      for child of children {
        child
      }
    </thead>
  }
}

component TableRow {
  property children : Array(Html) = []

  style row {
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    transition: all 0.2s ease;

    &:hover {
      background: rgba(102, 126, 234, 0.05);
    }

    &:last-child {
      border-bottom: none;
    }
  }

  fun render : Html {
    <tr::row>
      for child of children {
        child
      }
    </tr>
  }
}

component TableCell {
  property children : Array(Html) = []
  property isHeader : Bool = false

  style cell {
    padding: 1rem;
    text-align: left;
    color: #374151;
    vertical-align: middle;
  }

  style headerCell {
    padding: 1rem;
    text-align: left;
    color: white;
    font-weight: 600;
  }

  fun render : Html {
    if isHeader {
      <th::headerCell>
        for child of children {
          child
        }
      </th>
    } else {
      <td::cell>
        for child of children {
          child
        }
      </td>
    }
  }
}

/* List Component - Styled lists */
component List {
  property children : Array(Html) = []
  property variant : String = "unordered"
  property spacing : String = "0.5rem"

  style list {
    margin: 0;
    padding-left: 1.5rem;
    display: flex;
    flex-direction: column;
    gap: #{spacing};
  }

  style ordered {
    list-style: decimal;
  }

  style unordered {
    list-style: disc;
  }

  style none {
    list-style: none;
    padding-left: 0;
  }

  fun render : Html {
    if variant == "ordered" {
      <ol::list::ordered>
        for child of children {
          child
        }
      </ol>
    } else if variant == "none" {
      <ul::list::none>
        for child of children {
          child
        }
      </ul>
    } else {
      <ul::list::unordered>
        for child of children {
          child
        }
      </ul>
    }
  }
}

component ListItem {
  property children : Array(Html) = []

  style item {
    color: #374151;
    line-height: 1.6;
  }

  fun render : Html {
    <li::item>
      for child of children {
        child
      }
    </li>
  }
}

/* Calendar Component - Simple calendar display */
component Calendar {
  property currentDate : String = "2024-12-01"
  property selectedDate : String = ""

  state viewDate : String = currentDate
  state isVisible : Bool = true

  style calendar {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    padding: 1.5rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    max-width: 300px;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
    font-weight: 600;
    color: #374151;
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 0.5rem;
  }

  style dayHeader {
    text-align: center;
    font-size: 0.875rem;
    font-weight: 600;
    color: #6b7280;
    padding: 0.5rem;
  }

  style day {
    text-align: center;
    padding: 0.5rem;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
    color: #374151;

    &:hover {
      background: rgba(102, 126, 234, 0.1);
    }
  }

  style today {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-weight: 600;
  }

  style selected {
    background: rgba(102, 126, 234, 0.2);
    color: #4f46e5;
    font-weight: 600;
  }

  fun render : Html {
    <div::calendar>
      <div::header><span>"Diciembre 2024"</span></div>

      <div::grid>
        <div::dayHeader>"L"</div>
        <div::dayHeader>"M"</div>
        <div::dayHeader>"X"</div>
        <div::dayHeader>"J"</div>
        <div::dayHeader>"V"</div>
        <div::dayHeader>"S"</div>
        <div::dayHeader>"D"</div>

        <div::day>"1"</div>
        <div::day>"2"</div>
        <div::day>"3"</div>
        <div::day>"4"</div>
        <div::day>"5"</div>
        <div::day>"6"</div>
        <div::day>"7"</div>
        <div::day>"8"</div>
        <div::day>"9"</div>
        <div::day>"10"</div>
        <div::day>"11"</div>
        <div::day>"12"</div>
        <div::day>"13"</div>
        <div::day>"14"</div>
        <div::day class="today">"15"</div>
        <div::day>"16"</div>
        <div::day>"17"</div>
        <div::day>"18"</div>
        <div::day>"19"</div>
        <div::day>"20"</div>
        <div::day>"21"</div>
        <div::day>"22"</div>
        <div::day>"23"</div>
        <div::day>"24"</div>
        <div::day>"25"</div>
        <div::day>"26"</div>
        <div::day>"27"</div>
        <div::day>"28"</div>
        <div::day>"29"</div>
        <div::day>"30"</div>
        <div::day>"31"</div>
      </div>
    </div>
  }
}
