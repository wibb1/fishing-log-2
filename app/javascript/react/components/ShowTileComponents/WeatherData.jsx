import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const WeatherData = (props) => {
  return (
    <article className={`tile is-child  notification ${props.successColor}`}>
      <TableHelper
        divClassName={"box center"}
        tableClassName={"table has-text-centered"}
      >
        <tbody>
          <tr>
            <td>Air Temperature</td>
            <td>{props.airTemperature}</td>
          </tr>
          <tr>
            <td>Barometric Pressure</td>
            <td>{props.pressure}</td>
          </tr>
          <tr>
            <td>Cloud Cover</td>
            <td>{props.cloudCover}</td>
          </tr>
          <tr>
            <td>Visibility</td>
            <td>{props.visibility}</td>
          </tr>
          <tr>
            <td>Wind Gusts</td>
            <td>{props.gust}</td>
          </tr>
          <tr>
            <td>Wind Direction</td>
            <td>{props.windDirection}</td>
          </tr>
          <tr>
            <td>Wind Speed</td>
            <td>{props.windSpeed}</td>
          </tr>
          <tr>
            <td>Relative Humidity</td>
            <td>{props.humidity}</td>
          </tr>
        </tbody>
      </TableHelper>
    </article>
  );
};

export default WeatherData;
