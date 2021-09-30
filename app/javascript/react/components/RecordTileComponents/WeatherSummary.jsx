import React from 'react';
import TableHelper from '../../uxHelpers/TableHelper';

const WeatherSummary = props => {
  return (
    <article className={`tile is-child notification ${props.successColor} column`}>

    <TableHelper divClassName={"box center"}
      tableClassName={"table has-text-centered center"}>
        <tbody>
          <tr>
            <th>Measurement</th>
            <th>Units</th>
            <th>Value</th>
          </tr>
          <tr>
            <td>Pressure</td>
            <td>(inHg):</td>
            <td>{props.pressure}</td>
          </tr>
          <tr>
            <td>Humidity</td>
            <td>(%):</td>
            <td>{props.humidity}</td>
          </tr>
          <tr>
            <td>Wind Direction </td>
            <td>(degrees): </td>
            <td>{props.windDirection}</td>
          </tr>
          <tr>
            <td>Wind Speed </td>
            <td>(mph): </td>
            <td>{props.windSpeed}</td>
          </tr>
        </tbody>
      </TableHelper>

  </article>
  )
}
export default WeatherSummary
