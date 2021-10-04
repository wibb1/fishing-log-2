/* eslint-disable react/prop-types */

import React, { useState, useEffect } from "react";
import { Redirect } from "react-router-dom";
import ErrorList from "../components/ErrorList";
import _ from "lodash";

import Options from "../components/Options";
import ToTitleCase from "../utilities/ToTitleCase";
import FishingLogAPI from "../utilities/FishingLogAPI";

const RecordFormContainer = (props) => {
  const [getRecord, setRecord] = useState({
    name: "",
    latitude: "",
    latitudeDirection: "N",
    longitude: "",
    longitudeDirection: "E",
    datetime: "",
    species: "American eel",
    success: "Good",
    body: "",
  });
  const [getSpecies, setSpecies] = useState([]);
  const [getSuccesses, setSuccesses] = useState([
    { name: "Good", id: 0 },
    { name: "Bad", id: 1 },
    { name: "Meh", id: 2 },
  ]);
  const [errors, setErrors] = useState({});
  const [getUser, setUser] = useState({});

  useEffect(() => {
    FishingLogAPI.getData("records").then((records) => {
      // console.log(response);
    });

    FishingLogAPI.getData("all_species").then((species) => {
      setSpecies(species);
    });
  }, []);

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = [
      "name",
      "latitude",
      "latitudeDirection",
      "longitude",
      "longitudeDirection",
      // "datetime",
      "species",
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

  const clearForm = () => {
    setRecord({
      name: "",
      latitude: "",
      latitudeDirection: "",
      longitude: "",
      longitudeDirection: "",
      datetime: "",
      species: "",
      success: "",
      body: "",
    });
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
                    onChange={handleInputChange}
                    value={getRecord.species}
                  >
                    <Options
                      options={getSpecies.map((species) => ({
                        name: species.common_name,
                        id: species.id,
                      }))}
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
                        { name: "Good", id: 0 },
                        { name: "Bad", id: 1 },
                        { name: "Meh", id: 2 },
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
                  className="input"
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

          <div className="field">
            <label htmlFor="latitude" className="label">
              Latitude (in decimal format):
              <div className="control">
                <input
                  type="tel"
                  pattern="[0-9*]"
                  className="input"
                  id='latitude'
                  name='latitude'
                  placeholder="Between 0 and 90"
                  onChange={handleInputChange}
                  value={getRecord.latitude}
                ></input>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="latitudeDirection" className="label">
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="latitudeDirection"
                    name="latitudeDirection"
                    placeholder=""
                    onChange={handleInputChange}
                    value={getRecord.latitudeDirection}
                  >
                    <Options
                      options={[
                        { name: "N", id: 0 },
                        { name: "S", id: 1 },
                      ]}
                    />
                  </select>
                </div>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="longitude" className="label">
              Longitude (in decimal format):
              <div className="control">
                <input
                  type="number"
                  step='0.0001'
                  min='0'
                  max='180'
                  name='longitude'
                  id='longitude'
                  value={getRecord.longitude}
                  placeholder="Between 0 and 180"
                  onChange={handleInputChange}
                  className="input"
                />
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="longitudeDirection" className="label">
              <div className="control">
                <div className="select">
                  <select
                    className="select"
                    type="select"
                    id="longitudeDirection"
                    name="longitudeDirection"
                    placeholder=""
                    onChange={handleInputChange}
                    value={getRecord.longitudeDirection}
                  >
                    <Options
                      options={[
                        { name: "E", id: 0 },
                        { name: "W", id: 1 },
                      ]}
                    />
                  </select>
                </div>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="datetime" className="label">
              <div className="control">
                <div className="datetime_select">
                  <select
                    type="datetime_select"
                    htmlFor="datetime"
                    id="datetime"
                    name='datetime'
                    note="need datetime picker"
                    className="select"
                    onChange={handleInputChange}
                  />
                </div>
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
              className="button is-secondary has-text-weight-bold"
              onClick={clearForm}
            >
              Clear
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default RecordFormContainer;
