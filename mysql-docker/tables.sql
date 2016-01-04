-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Lun 04 Janvier 2016 à 23:13
-- Version du serveur :  5.5.38
-- Version de PHP :  5.5.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `twitter-machine-learning`
--

-- --------------------------------------------------------

--
-- Structure de la table `hashtag`
--

CREATE TABLE `hashtag` (
`id` int(11) NOT NULL,
  `tweet` int(11) NOT NULL,
  `text` varchar(139) NOT NULL,
  `indice_start` int(11) NOT NULL,
  `indice_end` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tweet`
--

CREATE TABLE `tweet` (
`id` int(11) NOT NULL,
  `twitter_id` varchar(300) NOT NULL,
  `text` varchar(200) NOT NULL,
  `user` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `hashtag`
--
ALTER TABLE `hashtag`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tweet`
--
ALTER TABLE `tweet`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `hashtag`
--
ALTER TABLE `hashtag`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=519;
--
-- AUTO_INCREMENT pour la table `tweet`
--
ALTER TABLE `tweet`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=339;