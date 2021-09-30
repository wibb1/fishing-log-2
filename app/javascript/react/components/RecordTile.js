import React from "react";
import { Link } from "react-router-dom";
import successColor from "../utilities/SuccessColor";
import MoonSunSummary from "./RecordTileComponents/MoonSunSummary";
import Tides from "./RecordTileComponents/Tides";
import WeatherSummary from "./RecordTileComponents/WeatherSummary";

const RecordTile = ({
  id,
  name,
  success,
  body,
  latitude,
  longitude,
  date,
  time,
  first_type,
  first_time,
  first_height,
  second_type,
  second_time,
  second_height,
  third_type,
  third_time,
  third_height,
  fourth_type,
  fourth_time,
  fourth_height,
  pressure,
  humidity,
  windDirection,
  windSpeed,
  moonFraction,
  moonPhase,
  sunrise,
  sunset,
  species,
}) => {
  const success_color = successColor(success);

  return (
    <div className="tile is-ancestor p-sm">
      <div className="tile is-vertical">
        <div className="tile is-parent">
          <Link to={`/records/react/${id}`}>
            <div
              className={`tile is-child notification ${success_color} is-12`}
            >
              <div className="box">
                <div className="columns is-centered">
                  <div className="column">
                    <p className="title is-size-3 is-size-4-touch">{name}</p>
                  </div>
                  <div className="column is-vcentered">
                    <div className="subtitle is-size-3 is-size-4-touch">
                      <p className="has-text-right">{date}</p>
                    </div>
                  </div>
                </div>
              </div>
              <div className="columns is-centered">
                <div className="column">
                  <div className="box">
                    <p className="subtitle is-size-4 is-5-touch has-text-weight-b">
                      <strong className="">Whats on the menu:</strong> {species}
                    </p>
                  </div>
                </div>
                <hr />
              </div>
              <div className="box">
                <p className="is-6">{body}</p>
              </div>
              <div className="columns is-centered">
                <Tides
                  successColor={success_color}
                  first_type={first_type}
                  first_time={first_time}
                  first_height={first_height}
                  second_height={second_height}
                  second_time={second_time}
                  second_type={second_type}
                  third_height={third_height}
                  third_time={third_time}
                  third_type={third_type}
                  fourth_height={fourth_height}
                  fourth_time={fourth_time}
                  fourth_type={fourth_type}
                />
                <WeatherSummary
                  successColor={success_color}
                  pressure={pressure}
                  humidity={humidity}
                  windDirection={windDirection}
                  windSpeed={windSpeed}
                />
                <MoonSunSummary
                  successColor={success_color}
                  moonFraction={moonFraction}
                  moonPhase={moonPhase}
                  sunrise={sunrise}
                  sunset={sunset}
                />
              </div>
            </div>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default RecordTile;
