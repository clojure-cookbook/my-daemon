(ns my-daemon.core
  (:import [org.apache.commons.daemon Daemon DaemonContext])
  (:gen-class
    :implements [org.apache.commons.daemon.Daemon]))

;; A crude approximation of your application's state.
(def state (atom {}))

(defn init [args]
  (swap! state assoc :running true))

(defn start []
  (while (:running @state)
    (println "tick")
    (Thread/sleep 2000)))

(defn stop []
  (swap! state assoc :running false))

;; Daemon implementation

(defn -init [this ^DaemonContext context]
  (init (.getArguments context)))

(defn -start [this]
  (future (start)))

(defn -stop [this]
  (stop))

(defn -destroy [this])

;; Enable command-line invocation
(defn -main [& args]
  (init args)
  (start))
