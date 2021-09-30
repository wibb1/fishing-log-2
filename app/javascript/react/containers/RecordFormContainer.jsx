/* eslint-disable react/prop-types */

import React, { useState, useEffect } from "react";
import { Redirect } from "react-router-dom";
import ErrorList from "../components/ErrorList";
import _ from "lodash";
import Options from "../components/Options";
import ToTitleCase from "../utilities/ToTitleCase";
import fetchRecord from "../utilities/GetRecord";

const RecordFormContainer = (props) => {
  const [getRecord, setRecord] = useState({
    name: "",
    latitude: "",
    latitudeDirection: "",
    longitude: "",
    longitudeDirection: "",
    dateTime: "",
    species: "",
    success: "",
    body: "",
  });
  const [errors, setErrors] = useState({});

  useEffect(() => {
    fetchRecord();
  }, []);

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = [
      "name",
      "latitude",
      "latitudeDirection",
      "longitude",
      "longitudeDirection",
      "dateTime",
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

  const onSubmitHandler = async (event) => {
    event.preventDefault();
    if (validForSubmission()) {
      addNewRecord(getRecord);
    }
  };

  const addNewRecord = (newRecord) => {
    fetch(`/api/v1/records`, {
      method: "POST",
      credentials: "same-origin",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newRecord),
    })
      .then((response) => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ${response.statusText}`,
            error = new Error(errorMessage);
          throw error;
        }
      })
      .then((body) => {
        setShouldRedirect(true);
      })
      .catch((error) => {
        console.error(`Error in fetch: ${error.message}`);
        setErrors(...errors, { "Error in fetch": error.message });
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
                <select
                  className="select"
                  type="select"
                  id="species"
                  name="species"
                  placeholder=""
                  onChange={handleInputChange}
                  value={getRecord.species}
                >
                  <Options options={getRecord.species} />
                </select>
              </div>
            </label>
          </div>

          <div className="field">
            <label className="label" htmlFor="success">
              <div className="control">
                <select
                  className="select"
                  type="select"
                  id="species"
                  name="species"
                  placeholder=""
                  onChange={handleInputChange}
                  value={getRecord.species}
                >
                  <Options options={getRecord.successes} />
                </select>
              </div>
            </label>
          </div>

          <div className="field">
            <label className="label" htmlFor="body">
              Spot Description:
              <div className="control">
                <input
                  className="input"
                  type="textarea"
                  id="name"
                  name="name"
                  placeholder="Spot Name"
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
                  placeholder="Typically 41.3 to 41.8"
                  value={getRecord.latitude}
                ></input>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="longitude" className="label">
              Longitude (in decimal format):
              <div className="control">
                <input
                  type="tel"
                  pattern="[0-9*]"
                  value={getRecord.longitude}
                  placeholder="Typically -70 to -70.6"
                  className="input"
                />
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="latitudeDirection" className="label">
              <div className="control">
                <div className="select">
                  <Options options={["N", "S"]} />
                </div>
              </div>
            </label>
          </div>

          <div className="field">
            <label htmlFor="longitudeDirection" className="label">
              <div className="control">
                <div className="select">
                  <select htmlFor="longitudeDirection" className="select">
                    <Options options={["E", "W"]} />
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
                    datetime_select
                    htmlFor="datetime"
                    note="need datetime picker"
                    className="select"
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
          </div>
        </form>
      </div>
    </div>
  );
};

export default RecordFormContainer;
