#!/usr/bin/env bash
# please download these models and adjust their locations accordingly
LEMMA_MODEL=$1 #models/lemma-eng.model
POS_MODEL=$2 #models/tagger-eng.model
PARSER_MODEL=$3 #models/parse-eng.model
SRL_MODEL=$4 #models/srl-ACL2016-eng.model
INPUT_FILE_TO_TEST=$5
RERANKER="-reranker -externalNNs"
TOKENIZE="-tokenize"

# java 1.8+ is required
JAVA=$(which java)

# parse INPUT_FILE_TO_TEST
$JAVA -Xmx16g  -jar PathLSTM/target/PathLSTM-1.0.0-jar-with-dependencies.jar  eng -lemma $LEMMA_MODEL -parser  $PARSER_MODEL -tagger $POS_MODEL -srl $SRL_MODEL $RERANKER $TOKENIZE -test $INPUT_FILE_TO_TEST

# old way of calling the script
#$JAVA -Xmx60g  se.lth.cs.srl.CompletePipeline eng -lemma $LEMMA_MODEL -parser $PARSER_MODEL -tagger $POS_MODEL -srl $SRL_MODEL $RERANKER $TOKENIZE -test $INPUT_FILE_TO_TEST
