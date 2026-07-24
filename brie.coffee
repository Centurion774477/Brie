#!/usr/bin/env coffee

fs = require 'fs'
yaml = require 'js-yaml'

utter = (utterance) ->
    console.log(utterance)

standardizeNumber = (number) ->
    return number if number in ['first', 'second', 'third', 'fourth', 'fifth',
    'sixth', 'seventh', 'eighth', 'ninth', 'tenth']
    standardizedInput = switch number
        when 'one'    then 'first'
        when 'two'    then 'second'
        when 'three'  then 'third'
        when 'four'   then 'fourth'
        when 'five'   then 'fifth'
        when 'six'    then 'sixth'
        when 'seven'  then 'seventh'
        when 'eight'  then 'eighth'
        when 'nine'   then 'ninth'
        when 'ten'    then 'tenth'
        else return
    return standardizedInput

readYaml = ->
    try
        rawData = fs.readFileSync 'brie.yaml', 'utf8'
        brieData = yaml.load rawData
    catch error
        utter "Brie failed to parse its internal registry: #{error}"
    return brieData

writeToYaml = (data) ->
    try
        yamlData = yaml.dump data,
            indent: 2
            lineWidth: -1
        await fs.writeFile 'brie.yaml', yamlData, 'utf8'
    catch error
        utter "Brie failed to save data to its internal registry: #{error}"


coagulate = (script, keyNumber="first") ->
    data = readYaml()
    keyNumber = standardizeNumber(keyNumber)
    data[keyNumber].script = script
    writeToYaml(data)
    
    utter "Brie assigned your script to key #{keyNumber}"

lick = (keyNumber="first") ->
    data = readYaml()
    keyNumber = standardizeNumber(keyNumber)
    utter data[keyNumber].script

terroir = ->
    data = readYaml()
    utter key for key of data

monger = (keyNumber) ->
    data = readYaml()
    key = standardizeNumber(keyNumber)
    utter data[key]

ripen = (keyNumber) ->
    data = readYaml()
    data.standardizeNumber(keyNumber) = true
    writeToYaml(data)
    utter "Brie ripened key #{keyNumber}"

soften = (keyNumber) ->
    data = readYaml()
    keyNumber = standardizeNumber(keyNumber)
    if data[keyNumber].ripened is false 
        utter "#{keyNumber} isn't hasn't been ripened yet; feel free to access it."
        return
    data[keyNumber] = false
    writeToYaml(data)
    
    utter "Brie softened key the #{keyNumber} key"


salt = (script, keyNumber) ->
    data = readYaml()
    keyNumber = standardizeNumber(keyNumber)

    if data.keyNumber.ripened is false
        utter "the #{keyNumber} hasn't been ripened yet. If you'd like to add a key to it, use coagulate."
    
    data.keyNumber.script = script
    writeToYaml(data)
    utter "Brie changed the #{keyNumber} key's script."



flag = process.argv[2]
argument = process.argv[3]
secondArgument = process.argv[4]

switch flag.toLowerCase()
    when 'coagulate' then coagulate(argument, secondArgument)
    when 'lick'      then lick(argument)
    when 'terroir'   then terroir()
    when 'monger'    then monger(argument)
    when 'ripen'     then ripen(argument)
    when 'soften'    then soften(argument)
    when 'salt'      then salt(argument, secondArgument)