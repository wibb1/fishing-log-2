import React from "react";
import MoonTable from "./ShowTileComponents/MoonTable";
import successColor from "../utilities/SuccessColor";
import SunTable from "./ShowTileComponents/SunTable";
import WeatherData from "./ShowTileComponents/WeatherData";
import WaveData from "./ShowTileComponents/WaveData";
import SeaData from "./ShowTileComponents/SeaData";
import Tides from "./RecordTileComponents/Tides";
import NavButtons from "./ShowTileComponents/NavButtons";
import RecordInfo from "./ShowTileComponents/RecordInfo";
import FigureArticle from "./ShowTileComponents/FigureArticle";
import BodyArticle from "./ShowTileComponents/BodyArticle";
import NameArticle from "./ShowTileComponents/NameArticle";

const ShowTile = ({ record, species }) => {
  const success_color = successColor(record.success);

  return (
    <div className="tile is-ancestor m-md">
      <div className="tile is-vertical m-md is-fullwidth">
        <div className="tile">
          <div className="tile is is-parent">
            <NameArticle successColor={success_color} name={record.name} />
            <NavButtons id={record.id} />
          </div>
        </div>
        <div className="tile is-verticle">
          <div className="tile is-vertical">
            <div className="tile">
              <div className="tile is-parent is-vertical">
                <RecordInfo
                  success_color={success_color}
                  date={record.date}
                  common_name={species.common_name}
                  latitude={record.latitude}
                  latitudeDirection={"Add Latitude Direction"}
                  longitude={record.longitude}
                  longitudeDirection={"Add Longitude Direction"}
                />
              </div>
              <div className="tile is-parent">
                <FigureArticle
                  successColor={success_color}
                  image={"../../assets/480x640.png"}
                />
              </div>
            </div>
            <div className="tile">
              <div className="tile is-parent">
                <BodyArticle successColor={success_color} body={record.body} />
              </div>
            </div>
            <div className="tile">
              <div className="tile is-parent">
                <MoonTable
                  successColor={success_color}
                  moonFraction={record.moonFraction}
                  moonPhase={record.moonPhase}
                  moonrise={record.moonrise}
                  moonset={record.moonset}
                />
              </div>
              <div className="tile is-parent">
                <SunTable
                  successColor={success_color}
                  astronomicalDawn={record.astronomicalDawn}
                  astronomicalDusk={record.astronomicalDusk}
                  civilDawn={record.civilDawn}
                  civilDusk={record.civilDusk}
                  sunrise={record.sunrise}
                  sunset={record.sunset}
                />
              </div>
            </div>
          </div>
          <div className="tile is-vertical is-4">
            <div className="tile ">
              <div className="tile is-parent is-vertical ">
                <WeatherData
                  successColor={success_color}
                  airTemperature={record.airTemperature}
                  pressure={record.pressure}
                  cloudCover={record.cloudCover}
                  visibility={record.visibility}
                  gusts={record.gust}
                  windDirection={record.windDirection}
                  windSpeed={record.windSpeed}
                  humidity={record.humidity}
                />
                <WaveData
                  successColor={success_color}
                  waveDirection={record.waveDirection}
                  waveHeight={record.waveHeight}
                  wavePeriod={record.wavePeriod}
                />
                <SeaData
                  successColor={success_color}
                  seaLevel={record.seaLevel}
                  currentDirection={record.currentDirection}
                  currentSpeed={record.currentSpeed}
                />

                <Tides
                  successColor={success_color}
                  first_type={record.first_type}
                  first_time={record.first_time}
                  first_height={record.first_height}
                  second_height={record.second_height}
                  second_time={record.second_time}
                  second_type={record.second_type}
                  third_height={record.third_height}
                  third_time={record.third_time}
                  third_type={record.third_type}
                  fourth_height={record.fourth_height}
                  fourth_time={record.fourth_time}
                  fourth_type={record.fourth_type}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ShowTile;
