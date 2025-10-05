component AddressEdit {
  /* Properties */
  property addressInfo : AddressEditInfo = {
    name: "",
    tel: "",
    province: "",
    city: "",
    county: "",
    addressDetail: "",
    areaCode: "",
    isDefault: false
  }

  property searchResult : Array(AddressEditSearchItem) = []
  property showDelete : Bool = false
  property showSetDefault : Bool = false
  property showSearchResult : Bool = false
  property showArea : Bool = true
  property showDetail : Bool = true
  property disableArea : Bool = false
  property saveButtonText : String = "Save"
  property deleteButtonText : String = "Delete"
  property detailRows : Number = 1
  property detailMaxlength : Number = 200
  property telMaxlength : Number = 20
  property isSaving : Bool = false
  property isDeleting : Bool = false
  property areaPlaceholder : String = "Area"
  property namePlaceholder : String = "Name"
  property telPlaceholder : String = "Phone"
  property detailPlaceholder : String = "Detailed Address"
  property onSave : Function(AddressEditInfo, Promise(Void)) = (info : AddressEditInfo) { Promise.resolve(void) }
  property onDelete : Function(AddressEditInfo, Promise(Void)) = (info : AddressEditInfo) { Promise.resolve(void) }
  property onChange : Function(String, String, Promise(Void)) = (key : String, value : String) { Promise.resolve(void) }
  property onChangeDetail : Function(String, Promise(Void)) = (value : String) { Promise.resolve(void) }
  property onChangeDefault : Function(Bool, Promise(Void)) = (checked : Bool) { Promise.resolve(void) }
  property onSelectSearch : Function(AddressEditSearchItem, Promise(Void)) = (item : AddressEditSearchItem) { Promise.resolve(void) }
  property onFocus : Function(String, Promise(Void)) = (key : String) { Promise.resolve(void) }
  property onClickArea : Function(Promise(Void)) = () { Promise.resolve(void) }
  property telValidator : Function(String, Bool) = (tel : String) { true }
  property validator : Function(String, String, String) = (key : String, value : String) { "" }
  property customContent : Html = <></>
  property areaColumnsPlaceholder : Array(String) = ["Choose", "Choose", "Choose"]

  /* State */
  state name : String = ""
  state tel : String = ""
  state province : String = ""
  state city : String = ""
  state county : String = ""
  state addressDetail : String = ""
  state areaCode : String = ""
  state isDefault : Bool = false
  state showAreaPicker : Bool = false
  state nameError : String = ""
  state telError : String = ""
  state areaError : String = ""
  state detailError : String = ""

  /* Styles - Mobile First Design */
  style container {
    background: var(--mint-background, #f7f8fa);
    min-height: 100vh;
    width: 100%;
  }

  style form {
    background: var(--mint-background-2, white);
  }

  style fields {
    padding: var(--mint-address-edit-padding, var(--mint-padding-sm, 12px));
  }

  style fieldRow {
    display: flex;
    align-items: center;
    padding: 10px 16px;
    background: white;
    border-bottom: 1px solid var(--mint-border-color, #ebedf0);
    min-height: 44px;
  }

  style fieldLabel {
    flex-shrink: 0;
    width: 6.2em;
    margin-right: 12px;
    font-size: 14px;
    color: var(--mint-text-color, #323233);
    line-height: 24px;
  }

  style fieldControl {
    flex: 1;
    display: flex;
    align-items: center;
  }

  style input {
    flex: 1;
    width: 100%;
    border: none;
    font-size: 14px;
    color: var(--mint-text-color, #323233);
    background: transparent;
    line-height: 24px;
    padding: 0;
    outline: none;

    &::placeholder {
      color: var(--mint-text-color-3, #c8c9cc);
    }

    &:disabled {
      color: var(--mint-text-color-3, #c8c9cc);
      cursor: not-allowed;
      opacity: 1;
    }
  }

  style textareaWrapper {
    padding: 10px 16px;
    background: white;
    border-bottom: 1px solid var(--mint-border-color, #ebedf0);
  }

  style textareaLabel {
    font-size: 14px;
    color: var(--mint-text-color, #323233);
    margin-bottom: 8px;
    line-height: 24px;
  }

  style textarea {
    width: 100%;
    border: none;
    font-size: 14px;
    color: var(--mint-text-color, #323233);
    background: transparent;
    resize: none;
    min-height: 60px;
    font-family: inherit;
    padding: 0;
    outline: none;
    line-height: 24px;

    &::placeholder {
      color: var(--mint-text-color-3, #c8c9cc);
    }
  }

  style error {
    color: var(--mint-danger-color, #ee0a24);
    font-size: 12px;
    padding: 4px 16px 8px;
    background: white;
    line-height: 16px;
  }

  style rightIcon {
    flex-shrink: 0;
    margin-left: 8px;
    color: var(--mint-text-color-3, #c8c9cc);
    font-size: 16px;
  }

  style defaultSwitch {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 16px;
    background: white;
    border-bottom: 1px solid var(--mint-border-color, #ebedf0);
    min-height: 44px;
  }

  style switchLabel {
    font-size: 14px;
    color: var(--mint-text-color, #323233);
    line-height: 24px;
  }

  style switch {
    position: relative;
    width: 2em;
    height: 1em;
    background: rgba(120, 120, 128, 0.16);
    border-radius: 1em;
    cursor: pointer;
    transition: background 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    flex-shrink: 0;
  }

  style switchOn {
    background: var(--mint-primary-color, #1989fa);
  }

  style switchNode {
    position: absolute;
    top: 2px;
    left: 2px;
    width: calc(1em - 4px);
    height: calc(1em - 4px);
    background: white;
    border-radius: 50%;
    transition: transform 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 3px 1px 0 rgba(0, 0, 0, 0.05), 0 2px 2px 0 rgba(0, 0, 0, 0.1), 0 3px 3px 0 rgba(0, 0, 0, 0.05);
  }

  style switchNodeOn {
    transform: translateX(calc(1em - 4px));
  }

  style buttons {
    padding: var(--mint-address-edit-buttons-padding, 16px 16px);
    display: flex;
    flex-direction: column;
    gap: var(--mint-address-edit-button-margin-bottom, 12px);
    background: white;
  }

  style button {
    width: 100%;
    height: 40px;
    padding: 0 16px;
    border-radius: var(--mint-radius-md, 2px);
    border: none;
    font-size: var(--mint-address-edit-button-font-size, var(--mint-font-size-lg, 16px));
    font-weight: 500;
    cursor: pointer;
    transition: opacity 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    line-height: 1.2;

    &:active {
      opacity: 0.7;
    }
  }

  style saveButton {
    background: var(--mint-primary-color, #1989fa);
    color: white;

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  style deleteButton {
    background: white;
    color: var(--mint-danger-color, #ee0a24);
    border: 1px solid var(--mint-danger-color, #ee0a24);

    &:active {
      background: #fff1f0;
    }
  }

  style searchResults {
    background: white;
    border-top: 1px solid var(--mint-border-color, #ebedf0);
    max-height: 200px;
    overflow-y: auto;
  }

  style searchItem {
    padding: 12px 16px;
    cursor: pointer;
    border-bottom: 1px solid var(--mint-border-color, #ebedf0);
    transition: background 0.3s ease;

    &:hover {
      background: var(--mint-background, #f8f9fa);
    }

    &:last-child {
      border-bottom: none;
    }
  }

  style searchName {
    font-size: 14px;
    font-weight: 500;
    color: var(--mint-text-color, #323233);
    margin-bottom: 4px;
  }

  style searchAddress {
    font-size: 12px;
    color: var(--mint-text-color-2, #969799);
  }

  style spinner {
    display: inline-block;
    width: 16px;
    height: 16px;
    border: 2px solid white;
    border-top-color: transparent;
    border-radius: 50%;
    animation: spin 0.6s linear infinite;
  }

  style spinnerDelete {
    border-color: var(--mint-danger-color, #ee0a24);
    border-top-color: transparent;
  }

  /* Functions */
  fun componentDidMount : Promise(Void) {
    next {
      name: addressInfo.name,
      tel: addressInfo.tel,
      province: addressInfo.province,
      city: addressInfo.city,
      county: addressInfo.county,
      addressDetail: addressInfo.addressDetail,
      areaCode: addressInfo.areaCode,
      isDefault: addressInfo.isDefault
    }
  }

  fun updateName (val : String) : Promise(Void) {
    next {
      name: val,
      nameError: ""
    }
    onChange("name", val)
  }

  fun updateTel (val : String) : Promise(Void) {
    next {
      tel: val,
      telError: ""
    }
    onChange("tel", val)
  }

  fun updateDetail (val : String) : Promise(Void) {
    next {
      addressDetail: val,
      detailError: ""
    }
    onChangeDetail(val)
  }

  fun handleNameFocus (event : Html.Event) : Promise(Void) {
    onFocus("name")
  }

  fun handleTelFocus (event : Html.Event) : Promise(Void) {
    onFocus("tel")
  }

  fun handleDetailFocus (event : Html.Event) : Promise(Void) {
    onFocus("addressDetail")
  }

  fun handleNameChange (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const value = event.target.value || "";
      #{updateName(`value`)}
    })()
    `
    Promise.resolve(void)
  }

  fun handleTelChange (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const value = event.target.value || "";
      #{updateTel(`value`)}
    })()
    `
    Promise.resolve(void)
  }

  fun handleDetailChange (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const value = event.target.value || "";
      #{updateDetail(`value`)}
    })()
    `
    Promise.resolve(void)
  }

  fun handleDefaultToggle (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const newValue = !#{isDefault};
      #{updateDefaultState(`newValue`)}
    })()
    `
    Promise.resolve(void)
  }

  fun updateDefaultState (newValue : Bool) : Promise(Void) {
    next { isDefault: newValue }
    onChangeDefault(newValue)
  }

  fun handleAreaClick (event : Html.Event) : Promise(Void) {
    if !disableArea {
      next { showAreaPicker: true }
      onClickArea()
    } else {
      Promise.resolve(void)
    }
  }

  fun setNameError : Promise(Void) {
    next { nameError: "Please fill in the name" }
  }

  fun setCustomNameError (message : String) : Promise(Void) {
    next { nameError: message }
  }

  fun setTelError (message : String) : Promise(Void) {
    next { telError: message }
  }

  fun setAreaError : Promise(Void) {
    next { areaError: "Please select area" }
  }

  fun setDetailError : Promise(Void) {
    next { detailError: "Please fill in the address" }
  }

  fun clearErrors : Promise(Void) {
    next {
      nameError: "",
      telError: "",
      areaError: "",
      detailError: ""
    }
  }

  fun getCurrentInfo : AddressEditInfo {
    {
      name: name,
      tel: tel,
      province: province,
      city: city,
      county: county,
      addressDetail: addressDetail,
      areaCode: areaCode,
      isDefault: isDefault
    }
  }

  fun validateAndSave : Promise(Void) {
    `
    (() => {
      const nameValidationError = #{validator("name", name)};
      const telValidationError = #{validator("tel", tel)};
      const telValid = #{telValidator(tel)};

      if (#{String.isEmpty(name)}) {
        #{setNameError()}
      } else if (nameValidationError) {
        #{setCustomNameError(`nameValidationError`)}
      } else if (#{String.isEmpty(tel)}) {
        #{setTelError("Please fill in the phone")}
      } else if (!telValid) {
        #{setTelError("Invalid phone number")}
      } else if (telValidationError) {
        #{setTelError(`telValidationError`)}
      } else if (#{showArea} && #{String.isEmpty(areaCode)}) {
        #{setAreaError()}
      } else if (#{showDetail} && #{String.isEmpty(addressDetail)}) {
        #{setDetailError()}
      } else {
        #{onSave(getCurrentInfo())}
      }
    })()
    `
    Promise.resolve(void)
  }

  fun handleSave (event : Html.Event) : Promise(Void) {
    `event.preventDefault()`
    clearErrors()
    validateAndSave()
  }

  /* Public Methods - Can be called from parent component */
  fun setAddressDetail (detail : String) : Promise(Void) {
    next { addressDetail: detail }
  }

  fun setAreaCode (code : String) : Promise(Void) {
    next { areaCode: code }
  }

  fun handleDelete (event : Html.Event) : Promise(Void) {
    `event.preventDefault()`
    onDelete(getCurrentInfo())
  }

  fun handleSearchItemClick (item : AddressEditSearchItem) : Promise(Void) {
    next { addressDetail: item.address }
    onSelectSearch(item)
  }

  fun getAreaText : String {
    if String.isNotEmpty(province) && String.isNotEmpty(city) && String.isNotEmpty(county) {
      province + " " + city + " " + county
    } else if String.isNotEmpty(areaCode) {
      "Selected"
    } else {
      ""
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <form::form onSubmit={handleSave}>
        <div::fields>
          /* Name Field */
          <div::fieldRow>
            <div::fieldLabel>"Name"</div>
            <div::fieldControl>
              <input::input
                type="text"
                value={name}
                placeholder={namePlaceholder}
                onFocus={handleNameFocus}
                onChange={handleNameChange}/>
            </div>
          </div>

          if String.isNotEmpty(nameError) {
            <div::error>{nameError}</div>
          }

          /* Phone Field */
          <div::fieldRow>
            <div::fieldLabel>"Phone"</div>
            <div::fieldControl>
              <input::input
                type="tel"
                value={tel}
                placeholder={telPlaceholder}
                maxlength={Number.toString(telMaxlength)}
                onFocus={handleTelFocus}
                onChange={handleTelChange}/>
            </div>
          </div>

          if String.isNotEmpty(telError) {
            <div::error>{telError}</div>
          }

          /* Area Field */
          if showArea {
            <div::fieldRow onClick={handleAreaClick}>
              <div::fieldLabel>"Area"</div>
              <div::fieldControl>
                <input::input
                  type="text"
                  value={getAreaText()}
                  placeholder={areaPlaceholder}
                  readonly={true}
                  disabled={disableArea}/>

                <span::rightIcon>"›"</span>
              </div>
            </div>

            if String.isNotEmpty(areaError) {
              <div::error>{areaError}</div>
            }
          }
        </div>

        /* Detailed Address */
        if showDetail {
          <div::textareaWrapper>
            <div::textareaLabel>"Detailed Address"</div>
            <textarea::textarea
              value={addressDetail}
              placeholder={detailPlaceholder}
              rows={Number.toString(detailRows)}
              maxlength={Number.toString(detailMaxlength)}
              onFocus={handleDetailFocus}
              onChange={handleDetailChange}/>
          </div>

          if String.isNotEmpty(detailError) {
            <div::error>{detailError}</div>
          }
        }

        /* Custom Content Slot */
        {customContent}

        if showSearchResult && Array.size(searchResult) > 0 {
          <div::searchResults>
            for item of searchResult {
              <div::searchItem onClick={(e : Html.Event) { handleSearchItemClick(item) }}>
                <div::searchName>{item.name}</div>
                <div::searchAddress>{item.address}</div>
              </div>
            }
          </div>
        }

        if showSetDefault {
          <div::defaultSwitch>
            <span::switchLabel>"Set as the default address"</span>
            <div::switch
              class={
                if isDefault {
                  "switchOn"
                } else {
                  ""
                }
              }
              onClick={handleDefaultToggle}>

              <div::switchNode
                class={
                  if isDefault {
                    "switchNodeOn"
                  } else {
                    ""
                  }
                }/>
            </div>
          </div>
        }

        <div::buttons>
          <button::button::saveButton
            type="submit"
            disabled={isSaving}>

            if isSaving {
              <div::spinner/>
            }

            <span>{saveButtonText}</span>
          </button>

          if showDelete {
            <button::button::deleteButton
              type="button"
              disabled={isDeleting}
              onClick={handleDelete}>

              if isDeleting {
                <div::spinner::spinnerDelete/>
              }

              <span>{deleteButtonText}</span>
            </button>
          }
        </div>
      </form>
    </div>
  }
}
