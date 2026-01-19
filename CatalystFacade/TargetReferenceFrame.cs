namespace CatalystFacade
{
    /// <summary>
    /// The datum transformation settings for the RTK Survey
    /// </summary>
    public enum TargetReferenceFrame
    {
        /// <summary>
        /// Don't apply datum transformation to the position, keep them as they are (in case of RTX this means ITRF2020(current), in case of RTK whatever local datum is configured)
        /// </summary>
        /// <remarks>The use case are applications which do support time dependent transformation or coordinate systems. Those applications want full control of the position - so the SDK acts only as bridge without touching anything.</remarks> 
        Off,
        /// <summary>
        /// Move Rtk to Rtx positions via time dependent datum transformation
        /// Source: Local datum, auto detected using polygons
        /// Target: ITRF 2020, current epoch
        /// </summary>
        /// <remarks>The use case are applications which need a WGS84/ ITRF2020(current) position. The transformation mainly affects RTK positions.</remarks> 
        ToGlobal,
        /// <summary>
        /// Move Rtk and Rtx positions via time dependent datum transformation
        /// Source: Local datum and ITRF 2020, current epoch
        /// Target: ITRF 2020, reference epoch: 2015.0
        /// </summary>
        /// <remarks>The use case are stand alone applications which want consistent (compareable) coordinates over time - but only compare coordinates created with the same software. In contrast to 'ToGlobal' the positions won't drift over time
        /// as they are fixed to epoch 2015.0. Therefore they can also be compared. But they can only be compared with other positions based on ITRF2020(2015) - so there will still be a difference if the same position is measured with RTK and a different software.
        /// Due to this both RTK and RTX position will get affected by this setting - as both get transformed.</remarks> 
        ToFixGlobal,
        /// <summary>
        /// Move Rtx to Rtk positions via time dependent datum transformation
        /// Source: ITRF 2020, current epoch
        /// Target: Local datum
        /// </summary>
        /// <remarks>The use case are applications which want consistent (compareable) coordinates not only within the SDK but also compared to other sources (or applications). It assumes that all coordiantes have been created with the same local datum. Typically this affects
        /// RTX and SBAS positions which get transformed to local ones.</remarks> 
        ToLocal,
        /// <summary>
        /// Use Trimble Mobile Manager settings
        /// </summary>
        UseLocalSettings,
        /// <summary>
        /// Move Rtx to Rtk positions via time dependent datum transformation
        /// Source: ITRF 2020, current epoch
        /// Target: Reference Frame input
        /// </summary>
        /// <remarks>The use case are applications which want consistent (compareable) coordinates not only within the SDK but also compared to other sources (or applications). It assumes that all coordiantes have been created with the same local datum. Typically this affects
        /// RTX and SBAS positions which get transformed to local ones.</remarks> 
        ToLocalWithTargetReferenceFrame
    }
}