/* eslint-disable react/prop-types */

import React, { useState, useEffect } from "react";
import { Redirect } from "react-router-dom";
import _ from "lodash";
import DatePicker from "react-datepicker";

import ErrorList from "../components/ErrorList";
import Options from "../components/Options";
import ToTitleCase from "../utilities/ToTitleCase";
import FishingLogAPI from "../utilities/FishingLogAPI";

const RecordFormContainer = (props) => {
  const [getSpecies, setSpecies] = useState([]);
  const [errors, setErrors] = useState({});
  const [getDatetime, setDatetime] = useState(new Date());

  useEffect(() => {
    FishingLogAPI.getData("all_species").then((response) => {
      setSpecies(response.species);
    });
  }, []);

  const [getRecord, setRecord] = useState({
    name: "",
    latitude: "",
    latitudeDirection: "N",
    longitude: "",
    longitudeDirection: "W",
    datetime: Date.now(),
    species_id: "1",
    success: "good",
    body: "",
  });

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = [
      "name",
      "latitude",
      "latitudeDirection",
      "longitude",
      "longitudeDirection",
      "datetime",
      "species_id",
      "success",
      "body",
    ];
    requiredFields.forEach((field) => {
      if (getRecord[field].trim == "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank",
        };
      }
    });
    setErrors(submitErrors);
    return _.isEmpty(submitErrors);
  };

  const [shouldRedirect, setShouldRedirect] = useState(false);

  const handleInputChange = (event) => {
    setRecord({
      ...getRecord,
      [event.currentTarget.id]: event.currentTarget.value,
    });
  };

  const handleIdChange = (event) => {
    const index = event.currentTarget.selectedIndex;
    const optionElement = event.currentTarget.childNodes[index];
    const optionElementId = optionElement.getAttribute("id");

    setRecord({ ...getRecord, [event.currentTarget.id]: optionElementId });
  };

  const onSubmitHandler = (event) => {
    event.preventDefault();
    if (validForSubmission()) {
      addNewRecord(getRecord);
    }
  };

  const addNewRecord = (newRecord) => {
    FishingLogAPI.postData("record", newRecord).then(() => {
      setShouldRedirect(true);
    });
  };

  const clearForm = (event) => {
    event.preventDefault()
    setRecord({
      name: "",
      latitude: "",
      latitudeDirection: "N",
      longitude: "",
      longitudeDirection: "E",
      datetime: "",
      species_id: "1",
      success: "0",
      body: "",
    });
    setErrors({})
  };

  if (shouldRedirect) {
    return <Redirect to="/records/react" />;
  }
  return (
    <div>
      <section className="hero">
        <div className="hero-body">
          <div className="container">
            <h1 className="title">New Record</h1>
          </div>
        </div>
      </section>

      <div className="section-indent m-md">
        <div className="container has-text-dark"></div>

        <form onSubmit={onSubmitHandler}>
          <ErrorList errors={errors} />

          <div className="field">
            <label className="label" htmlFor="name">
              <div className="control">
                <input
                  className="input"
                  type="text"
                  id="name"
                  name="name"
                  placeholder="Spot Name"
                  onChange={handleInputChange}
                  value={ToTitleCase(getRecord.name)}
                />
              </div>
            </label>
          </div>

          <div className="field">
            <label className="label" htmlFor="species">
              Select the Species:
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="species"
                    name="species"
                    placeholder=""
                    onChange={handleIdChange}
                    value={getRecord.species}
                  >
                    <Options
                      options={getSpecies
                        .map((species) => ({
                          name: species.common_name,
                          id: species.id,
                        }))
                        .sort((a, b) =>
                          a.name.toUpperCase() > b.name.toUpperCase() ? 1 : -1
                        )}
                    />
                  </select>
                </div>{" "}
              </div>
            </label>
          </div>

          <div className="field">
            <label className="label" htmlFor="success">
              How was your day?
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="success"
                    name="success"
                    placeholder=""
                    onChange={handleInputChange}
                    value={getRecord.success}
                  >
                    <Options
                      options={[
                        { name: "good", id: 0 },
                        { name: "bad", id: 1 },
                        { name: "meh", id: 2 },
                      ]}
                    />
                  </select>
                </div>{" "}
              </div>
            </label>
          </div>

          <div className="field">
            <label className="label" htmlFor="body">
              Spot Description:
              <div className="control">
                <textarea
                  className="textarea"
                  type="textarea"
                  id="body"
                  name="body"
                  placeholder="Enter text here with a good description of your day"
                  onChange={handleInputChange}
                  value={getRecord.body}
                />
              </div>
            </label>
          </div>

          <div className="field is-grouped">
            <label htmlFor="latitude" className="label">
              Latitude (in decimal format):
              <div className="control">
                <input
                  type="number"
                  step="0.0001"
                  min="0"
                  max="90"
                  className="input"
                  id="latitude"
                  name="latitude"
                  placeholder="Between 0 and 90"
                  onChange={handleInputChange}
                  value={getRecord.latitude}
                ></input>
              </div>
            </label>
            <label htmlFor="latitudeDirection" className="label ml-5">
              Latitude Direction:
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="latitudeDirection"
                    name="latitudeDirection"
                    onChange={handleInputChange}
                    value={getRecord.latitudeDirection}
                  >
                    <Options
                      options={[
                        { name: "N", id: 1 },
                        { name: "S", id: -1 },
                      ]}
                    />
                  </select>
                </div>
              </div>
            </label>
          </div>

          <div className="field is-grouped">
            <label htmlFor="longitude" className="label">
              Longitude (in decimal format):
              <div className="control">
                <input
                  type="number"
                  step="0.0001"
                  min="0"
                  max="180"
                  name="longitude"
                  id="longitude"
                  value={getRecord.longitude}
                  placeholder="Between 0 and 180"
                  onChange={handleInputChange}
                  className="input"
                />
              </div>
            </label>
            <label htmlFor="longitudeDirection" className="label ml-5"> Longitude Direction:
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="longitudeDirection"
                    name="longitudeDirection"
                    onChange={handleInputChange}
                    value={getRecord.longitudeDirection}
                  >
                    <Options
                      options={[
                        { name: "E", id: 1 },
                        { name: "W", id: -1 },
                      ]}
                    />
                  </select>
                </div>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="datetime" className="label">
              Enter the date and time:
              <div className="control">
                <DatePicker
                  selected={getDatetime}
                  excludeOutOfBoundsTimes
                  onChange={(date) => setDatetime(date)}
                  maxDate={new Date()}
                  dateFormat="MM/dd/yyyy hh:mm aa"
                  showTimeSelect
                  timeIntervals={15}
                  timeCaption="Time"
                />
              </div>
            </label>
          </div>

          <div className="field">
            <input
              type="submit"
              className="button is-primary has-text-weight-bold"
              value="Submit"
            />
            <button
              className="button is-secondary has-text-weight-bold ml-3"
              onClick={clearForm}
            >
              Clear Form
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default RecordFormContainer;
